USE VillageGreen;
-- Vue correspondant à la jointure Produits - Fournisseurs :
CREATE VIEW Vue_Produit_Fournisseur AS
SELECT p.Id_Produit, p.Libelle_court AS Produit, p.Libelle_long AS Description, p.Prix_achat_HT AS Prix,
       f.Nom AS Fournisseur
FROM Produit p
JOIN Fournisseur f ON p.Id_Fournisseur = f.Id_Fournisseur;

-- Vue correspondant à la jointure Produits - Catégorie/Sous-catégorie :
CREATE VIEW Vue_Produit_Categorie AS
SELECT p.Id_Produit, p.Libelle_court AS Produit, p.Libelle_long AS Description, p.Prix_achat_HT AS Prix,
       c.Libelle_court AS Categorie, sc.Libelle_court AS Souscategorie
FROM Produit p
JOIN Souscategorie sc ON p.Id_Souscategorie = sc.Id_Souscategorie
JOIN Categorie c ON sc.Id_Catégorie = c.Id_Catégorie;
