USE VillageGreen;
-- Chiffre d'affaires mois par mois pour une année sélectionnée :
SELECT MONTH(Date_facturation) AS Mois, SUM(Total_TTC) AS CA_Mois
FROM Commande
WHERE YEAR(Date_facturation) = 2024
GROUP BY Mois;
