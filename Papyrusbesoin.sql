USE papyrus;
-- Quelles sont les commandes du fournisseur 09120 ?
SELECT *
FROM entcom
WHERE numfou = 9120;
-- Affiche le code des fournisseurs pour lesquels des commandes ont été passées
SELECT DISTINCT fourn.numfou, fourn.nomfou
FROM entcom
JOIN fournis fourn ON entcom.numfou = fourn.numfou;
-- Affiche le nombre de commandes fournisseurs passées, et le nombre
-- de fournisseur concernés
SELECT 
    COUNT(DISTINCT numcom) AS nb_commandes,
    COUNT(DISTINCT numfou) AS nb_fournisseurs
FROM entcom;
-- Editer les produits ayant un stock inférieur ou égal au stock d'alerte et
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
-- Quels sont les fournisseurs situés dans les départements 75 78 92 77 ?
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
-- Quelles sont les commandes passées au mois de mars et avril ?
SELECT *
FROM entcom
WHERE MONTH(datcom) IN (3, 4);
-- Quelles sont les commandes du jour qui ont des observations
-- particulières ?
-- (Affichage numéro de commande, date de commande)
SELECT numcom AS 'Numéro de commande', datcom AS 'Date de commande'
FROM entcom
WHERE DATE(datcom) = CURDATE() AND obscom <> '';
----------------------------------------------------------------------------
SELECT numcom AS 'Numéro de commande', datcom AS 'Date de commande'
FROM entcom
WHERE DATE(datcom) = '2021-06-05' AND obscom <> '';
-- Lister le total de chaque commande par total décroissant
-- (Affichage numéro de commande et total)
SELECT numcom AS 'Numéro de commande', 
       SUM(qtecde * priuni) AS 'Total'
FROM ligcom
GROUP BY numcom
ORDER BY Total DESC;
-- Lister les commandes dont le total est supérieur à 10 000€ ; on exclura
-- dans le calcul du total les articles commandés en quantité supérieure
-- ou égale à 1000.
-- (Affichage numéro de commande et total)
SELECT numcom AS 'Numéro de commande', 
       SUM(CASE WHEN qtecde < 1000 THEN qtecde * priuni ELSE 0 END) AS 'Total'
FROM ligcom
GROUP BY numcom
HAVING Total > 10000
ORDER BY Total DESC;



