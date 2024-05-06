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


