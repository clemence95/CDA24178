USE VillageGreen;
-- Vue correspondant à la jointure Produits - Fournisseurs :
CREATE VIEW Vue_Produits_Fournisseurs AS
SELECT
    p.Id_Produit,
    p.Libelle_court AS Produit,
    p.Libelle_long AS Description,
    p.Prix_achat_HT AS Prix_achat_HT,
    p.Photo AS Photo_produit,
    p.stock AS Stock,
    p.Actif AS Actif,
    f.Id_Fournisseur,
    f.Nom AS Fournisseur,
    f.Contact AS Contact_fournisseur,
    f.telephone AS Telephone_fournisseur
FROM
    produit p
JOIN
    Fournisseur f ON p.Id_Fournisseur = f.Id_Fournisseur;


-- Vue correspondant à la jointure Produits - Catégorie/Sous-catégorie :
CREATE VIEW Vue_Produits_Categories AS
SELECT
    p.Id_Produit,
    p.Libelle_court AS Produit,
    p.Libelle_long AS Description,
    p.Prix_achat_HT AS Prix_achat_HT,
    p.Photo AS Photo_produit,
    p.stock AS Stock,
    p.Actif AS Actif,
    sc.Id_Souscategorie,
    sc.Libelle_court AS Souscategorie,
    c.Id_Categorie,
    c.Libelle_court AS Categorie
FROM
    produit p
JOIN
    souscategorie sc ON p.Id_Souscategorie = sc.Id_Souscategorie
JOIN
    categorie c ON sc.Id_Categorie = c.Id_Categorie;

