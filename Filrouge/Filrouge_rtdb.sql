USE VillageGreen;
-- Chiffre d'affaires mois par mois pour une année sélectionnée :
SELECT MONTH(Date_facturation) AS Mois, YEAR(Date_facturation) AS Annee, SUM(Total_TTC) AS Chiffre_affaires
FROM Commande
WHERE YEAR(Date_facturation) = '2024'
GROUP BY Mois;
-- Chiffre d'affaires Fournisseur
SELECT Fournisseur.Nom AS Nom_Fournisseur,
       SUM(Commande.Total_TTC) AS Chiffre_affaires
FROM Commande
INNER JOIN achete ON Commande.Id_Commande = achete.Id_Commande
INNER JOIN Produit ON achete.Id_Produit = Produit.Id_Produit
INNER JOIN Fournisseur ON Produit.Id_Fournisseur = Fournisseur.Id_Fournisseur
GROUP BY Fournisseur.Nom;







