USE papyrus;
--1 Quelles sont les commandes du fournisseur 09120 ?
SELECT *
FROM entcom
WHERE numfou = 9120;
-- 2 Affiche le code des fournisseurs pour lesquels des commandes ont été passées
SELECT DISTINCT fourn.numfou, fourn.nomfou
FROM entcom
JOIN fournis fourn ON entcom.numfou = fourn.numfou;
-- 3 Affiche le nombre de commandes fournisseurs passées, et le nombre
-- de fournisseur concernés
SELECT 
    COUNT(DISTINCT numcom) AS nb_commandes,
    COUNT(DISTINCT numfou) AS nb_fournisseurs
FROM entcom;
-- 4 Editer les produits ayant un stock inférieur ou égal au stock d'alerte et
-- dont la quantité annuelle est inférieur est inférieure à 1000
-- (informations à fournir : n° produit, libellé produit, stock, stock actuel
-- d'alerte, quantité annuelle)
SELECT 
    codart AS 'N° produit',
    libart AS 'Libellé produit',
    stkphy AS 'Stock',
    stkale AS 'Stock d\'alerte',
    qteann AS 'Quantité annuelle'
FROM produit
WHERE stkphy <= stkale AND qteann < 1000;
-- 5 Quels sont les fournisseurs situés dans les départements 75 78 92 77 ?
-- L’affichage (département, nom fournisseur) sera effectué par
-- département décroissant, puis par ordre alphabétique
SELECT 
    fourn.vilfou AS 'Département',
    fourn.nomfou AS 'Nom fournisseur'
FROM fournis fourn
JOIN (
    SELECT '75' AS 'dept' UNION ALL
    SELECT '78' UNION ALL
    SELECT '92' UNION ALL
    SELECT '77'
) depts ON fourn.posfou LIKE CONCAT(depts.dept, '%')
ORDER BY fourn.vilfou DESC, fourn.nomfou;
-- 6 Quelles sont les commandes passées au mois de mars et avril ?
SELECT *
FROM entcom
WHERE MONTH(datcom) IN (3, 4);
-- 7 Quelles sont les commandes du jour qui ont des observations
-- particulières ?
-- (Affichage numéro de commande, date de commande)
SELECT numcom AS 'Numéro de commande', datcom AS 'Date de commande'
FROM entcom
WHERE DATE(datcom) = CURDATE() AND obscom <> '';
----------------------------------------------------------------------------
SELECT numcom AS 'Numéro de commande', datcom AS 'Date de commande'
FROM entcom
WHERE DATE(datcom) = '2021-06-05' AND obscom <> '';
-- 8 Lister le total de chaque commande par total décroissant
-- (Affichage numéro de commande et total)
SELECT numcom AS 'Numéro de commande', 
       SUM(qtecde * priuni) AS 'Total'
FROM ligcom
GROUP BY numcom
ORDER BY Total DESC;
-- 9 Lister les commandes dont le total est supérieur à 10 000€ ; on exclura
-- dans le calcul du total les articles commandés en quantité supérieure
-- ou égale à 1000.
-- (Affichage numéro de commande et total)
SELECT numcom AS 'Numéro de commande', 
       SUM(CASE WHEN qtecde < 1000 THEN qtecde * priuni ELSE 0 END) AS 'Total'
FROM ligcom
GROUP BY numcom
HAVING Total > 10000
ORDER BY Total DESC;
-- 10 Lister les commandes par nom fournisseur
-- (Afficher le nom du fournisseur, le numéro de commande et la date)
SELECT fourn.nomfou AS 'Nom du fournisseur', 
       entcom.numcom AS 'Numéro de commande', 
       entcom.datcom AS 'Date'
FROM entcom
JOIN fournis fourn ON entcom.numfou = fourn.numfou
ORDER BY fourn.nomfou;
-- 11 Sortir les produits des commandes ayant le mot "urgent' en
-- observation?
-- (Afficher le numéro de commande, le nom du fournisseur, le libellé du
-- produit et le sous total = quantité commandée * Prix unitaire)
SELECT entcom.numcom AS 'Numéro de commande',
       fourn.nomfou AS 'Nom du fournisseur',
       produit.libart AS 'Libellé du produit',
       ligcom.qteliv AS 'Quantité commandée',
       ligcom.priuni AS 'Prix unitaire',
       (ligcom.qteliv * ligcom.priuni) AS 'Total du produit',
       total_commande.total AS 'Total de la commande'
FROM entcom
JOIN fournis AS fourn ON entcom.numfou = fourn.numfou
JOIN ligcom ON entcom.numcom = ligcom.numcom
JOIN produit ON ligcom.codart = produit.codart
JOIN (
    SELECT numcom, SUM(qteliv * priuni) AS total
    FROM ligcom
    GROUP BY numcom
) AS total_commande ON entcom.numcom = total_commande.numcom
WHERE entcom.obscom LIKE '%urgent%'
ORDER BY entcom.numcom, fourn.nomfou;
-- 12 Coder de 2 manières différentes la requête suivante :
-- Lister le nom des fournisseurs susceptibles de livrer au moins un article
-- Approche 1 : Utilisation d'une sous-requête EXISTS
SELECT DISTINCT nomfou
FROM fournis
WHERE EXISTS (
    SELECT 1
    FROM vente
    WHERE vente.numfou = fournis.numfou
);
-- 13 Approche 2 : Utilisation d'une jointure avec GROUP BY
SELECT fournis.nomfou
FROM fournis
JOIN vente ON fournis.numfou = vente.numfou
GROUP BY fournis.nomfou;
-- 14 Coder de 2 manières différentes la requête suivante
-- Lister les commandes (Numéro et date) dont le fournisseur est celui de
-- la commande 70210 
-- Approche 1 : Utilisation d'une sous-requête
SELECT numcom, datcom
FROM entcom
WHERE numfou = (
    SELECT numfou
    FROM entcom
    WHERE numcom = 70210
);
-- 15 Approche 2 : Utilisation d'une jointure
SELECT entcom.numcom, entcom.datcom
FROM entcom
JOIN (
    SELECT numfou
    FROM entcom
    WHERE numcom = 70210
) AS fournisseur_70210 ON entcom.numfou = fournisseur_70210.numfou;
-- 16 Dans les articles susceptibles d’être vendus, lister les articles moins
-- chers (basés sur Prix1) que le moins cher des rubans (article dont le
-- premier caractère commence par R). On affichera le libellé de l’article
-- et prix1
SELECT p.libart, MIN(v.prix1) AS prix_unitaire
FROM produit p
JOIN vente v ON p.codart = v.codart
WHERE LEFT(p.libart, 1) != 'R'
GROUP BY p.libart
HAVING MIN(v.prix1) < (
    SELECT MIN(v2.prix1)
    FROM vente v2
    WHERE LEFT(v2.codart, 1) = 'R'
);
-- 17 Editer la liste des fournisseurs susceptibles de livrer les produits
-- dont le stock est inférieur ou égal à 150 % du stock d'alerte. La liste est
-- triée par produit puis fournisseur
SELECT p.libart AS nom_produit, v.numfou, f.nomfou AS nom_fournisseur
FROM produit p
JOIN vente v ON p.codart = v.codart
JOIN fournis f ON v.numfou = f.numfou
WHERE p.stkphy <= 1.5 * p.stkale
ORDER BY p.codart, f.nomfou;
-- 18 Avec le même type de sélection que ci-dessus, sortir un total des
-- stocks par fournisseur trié par total décroissant
SELECT f.numfou, f.nomfou AS nom_fournisseur, SUM(p.stkphy) AS total_stock
FROM produit p
JOIN vente v ON p.codart = v.codart
JOIN fournis f ON v.numfou = f.numfou
GROUP BY f.numfou, f.nomfou
ORDER BY total_stock DESC;
-- 19 En fin d'année, sortir la liste des produits dont la quantité réellement
-- commandée dépasse 90% de la quantité annuelle prévue
SELECT p.libart AS nom_produit, SUM(l.qtecde) AS quantite_commandee, p.qteann
FROM produit p
JOIN ligcom l ON p.codart = l.codart
WHERE YEAR(l.derliv) = 2021
GROUP BY p.codart
HAVING SUM(l.qtecde) > 0.9 * p.qteann;
-- 20 Calculer le chiffre d'affaire par fournisseur pour l'année 93 sachant  WHY 93!
-- que les prix indiqués sont hors taxes et que le taux de TVA est 20%
SELECT e.numfou, 
       SUM(l.qtecde * l.priuni) AS chiffre_affaire_HT,
       SUM((l.qtecde * l.priuni) + (l.qtecde * l.priuni * 0.2)) AS chiffre_affaire_TTC
FROM ligcom l
JOIN produit p ON l.codart = p.codart
JOIN entcom e ON l.numcom = e.numcom
WHERE YEAR(e.datcom) = 1993
GROUP BY e.numfou;
--21 Existe-t-il des lignes de commande non cohérentes avec les produits
-- vendus par les fournisseurs. ?
SELECT lc.numcom, lc.numlig, lc.codart AS produit_commande, lc.qtecde AS quantite_commandee, 
       v.numfou AS fournisseur, v.codart AS produit_fournisseur, 
       CASE
           WHEN v.codart IS NULL THEN 'Non trouvé'
           WHEN lc.qtecde > v.qte1 THEN 'Quantité trop élevée'
           ELSE 'OK'
       END AS coherence
FROM ligcom lc
LEFT JOIN vente v ON lc.codart = v.codart
WHERE v.codart IS NULL OR lc.qtecde > v.qte1;


-- Application d'une augmentation de tarif de 4% pour le prix 1 et de 2%
-- pour le prix2 pour le fournisseur 9180
UPDATE vente
SET prix1 = prix1 * 1.04, prix2 = prix2 * 1.02
WHERE numfou = 9180;

-- affiche les prix mis à jour pour le fournisseur 9180 dans la table "vente". 
SELECT codart, numfou, prix1, prix2
FROM vente
WHERE numfou = 9180;








































