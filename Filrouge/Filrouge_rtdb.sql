-- Chiffre d'affaires mois par mois pour une année sélectionnée et pour tous les fournisseurs :
SELECT
    MONTH(Date_facturation) AS Mois,
    YEAR(Date_facturation) AS Annee,
    'VillageGreen' AS Nom_Fournisseur, -- Ajout d'une colonne vide pour aligner avec la deuxième requête
    SUM(Total_TTC) AS Chiffre_affaires
FROM Commande
WHERE
    YEAR(Date_facturation) = '2024'
GROUP BY
    Annee,
    Mois

UNION ALL
-- Chiffre d'affaires par fournisseur mois par mois pour une année sélectionnée :
SELECT
    MONTH(Commande.Date_facturation) AS Mois,
    YEAR(Commande.Date_facturation) AS Annee,
    Fournisseur.Nom AS Nom_Fournisseur,
    SUM(Commande.Total_TTC) AS Chiffre_affaires
FROM
    Commande
    INNER JOIN achete ON Commande.Id_Commande = achete.Id_Commande
    INNER JOIN Produit ON achete.Id_Produit = Produit.Id_Produit
    INNER JOIN Fournisseur ON Produit.Id_Fournisseur = Fournisseur.Id_Fournisseur
WHERE
    YEAR(Commande.Date_facturation) = '2024'
GROUP BY
    Annee,
    Mois,
    Nom_Fournisseur;

-- TOP 10 des produits les plus commandés pour une année sélectionnée (référence et nom du produit, quantité commandée, fournisseur)
SELECT
    Produit.Id_Produit AS Reference_Produit,
    Produit.Libelle_court AS Nom_Produit,
    SUM(achete.quantite) AS Quantite_Commandee,
    Fournisseur.Nom AS Nom_Fournisseur
FROM
    Commande
    INNER JOIN achete ON Commande.Id_Commande = achete.Id_Commande
    INNER JOIN Produit ON achete.Id_Produit = Produit.Id_Produit
    INNER JOIN Fournisseur ON Produit.Id_Fournisseur = Fournisseur.Id_Fournisseur
WHERE
    YEAR(Commande.Date_heure_commande) = 2024
GROUP BY
    Produit.Id_Produit,
    Produit.Libelle_court,
    Fournisseur.Nom
ORDER BY SUM(achete.quantite) DESC
LIMIT 10;

-- TOP 10 des produits les plus rémunérateurs pour une année sélectionnée, vous pouvez utiliser la requête suivante :
SELECT
    Produit.Id_Produit AS Reference_Produit,
    Produit.Libelle_court AS Nom_Produit,
    SUM(
        Commande.Total_TTC - Produit.Prix_achat_HT * achete.quantite
    ) AS Marge,
    Fournisseur.Nom AS Nom_Fournisseur
FROM
    Commande
    INNER JOIN achete ON Commande.Id_Commande = achete.Id_Commande
    INNER JOIN Produit ON achete.Id_Produit = Produit.Id_Produit
    INNER JOIN Fournisseur ON Produit.Id_Fournisseur = Fournisseur.Id_Fournisseur
WHERE
    YEAR(Commande.Date_facturation) = '2024'
GROUP BY
    Produit.Id_Produit,
    Produit.Libelle_court,
    Fournisseur.Nom
ORDER BY Marge DESC
LIMIT 10;

-- Top 10 par nombre de commandes :
SELECT 
    c.Nom AS Nom_Client,
    COUNT(cm.Id_Commande) AS Nombre_Commandes
FROM 
    Client c
INNER JOIN 
    Commande cm ON c.Id_Client = cm.Id_Client
GROUP BY 
    c.Id_Client
ORDER BY 
    Nombre_Commandes DESC
LIMIT 10;


-- Top 10 des clients par chiffre d'affaires :
SELECT 
    c.Nom AS Nom_Client,
    SUM(cm.Total_TTC) AS Chiffre_affaires
FROM 
    Client c
INNER JOIN 
    Commande cm ON c.Id_Client = cm.Id_Client
GROUP BY 
    c.Id_Client
ORDER BY 
    Chiffre_affaires DESC
LIMIT 10;


