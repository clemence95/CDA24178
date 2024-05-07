USE VillageGreen;
-- Chiffre d'affaires mois par mois pour une année sélectionnée :
SELECT MONTH(Date_facturation) AS Mois, YEAR(Date_facturation) AS Annee, SUM(Total_TTC) AS Chiffre_affaires
FROM Commande
WHERE YEAR(Date_facturation) = '2024'
GROUP BY Mois;



