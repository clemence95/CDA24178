-- Chiffre d'affaires mois par mois pour une année sélectionnée et pour tous les fournisseurs :
SELECT MONTH(Date_facturation) AS Mois,
       YEAR(Date_facturation) AS Annee,
       'VillageGreen' AS Nom_Fournisseur, -- Ajout d'une colonne vide pour aligner avec la deuxième requête
       SUM(Total_TTC) AS Chiffre_affaires
FROM Commande
WHERE YEAR(Date_facturation) = '2024'
GROUP BY Annee, Mois

UNION ALL

-- Chiffre d'affaires par fournisseur mois par mois pour une année sélectionnée :
SELECT MONTH(Commande.Date_facturation) AS Mois,
       YEAR(Commande.Date_facturation) AS Annee,
       Fournisseur.Nom AS Nom_Fournisseur,
       SUM(Commande.Total_TTC) AS Chiffre_affaires
FROM Commande
INNER JOIN achete ON Commande.Id_Commande = achete.Id_Commande
INNER JOIN Produit ON achete.Id_Produit = Produit.Id_Produit
INNER JOIN Fournisseur ON Produit.Id_Fournisseur = Fournisseur.Id_Fournisseur
WHERE YEAR(Commande.Date_facturation) = '2024'
GROUP BY Annee, Mois, Nom_Fournisseur;











