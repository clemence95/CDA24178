USE cp;

ALTER TABLE client ENGINE=InnoDB;

DELIMITER |
CREATE TRIGGER maj_total AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
    DECLARE id_c INT;
    DECLARE tot DOUBLE;
    SET id_c = NEW.id_commande; -- nous captons le numéro de commande concerné
    SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c); -- on recalcule le total
        -- SET tot = ??? (prévoir le calcul de la remise) 
    UPDATE commande SET total=tot WHERE id=id_c; -- on stocke le total dans la table commande
    END;
|
DELIMITER ;

DELIMITER |
CREATE TRIGGER maj_total_insert AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
    DECLARE id_c INT;
    DECLARE tot DOUBLE;
    SET id_c = NEW.id_commande;
    SET tot = (SELECT SUM(prix*quantite) FROM lignedecommande WHERE id_commande = id_c);
    UPDATE commande SET total = tot WHERE id = id_c;
    END;
|

CREATE TRIGGER maj_total_update AFTER UPDATE ON lignedecommande
    FOR EACH ROW
    BEGIN
    DECLARE id_c INT;
    DECLARE tot DOUBLE;
    SET id_c = NEW.id_commande;
    SET tot = (SELECT SUM(prix*quantite) FROM lignedecommande WHERE id_commande = id_c);
    UPDATE commande SET total = tot WHERE id = id_c;
    END;
|

CREATE TRIGGER maj_total_delete AFTER DELETE ON lignedecommande
    FOR EACH ROW
    BEGIN
    DECLARE id_c INT;
    DECLARE tot DOUBLE;
    SET id_c = OLD.id_commande;
    SET tot = (SELECT SUM(prix*quantite) FROM lignedecommande WHERE id_commande = id_c);
    UPDATE commande SET total = tot WHERE id = id_c;
    END;
|
DELIMITER ;

-- Pour modifier un produit dans une commande :
INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (3, 2, 100, 3);

-- Pour supprimer un produit d'une commande :
DELETE FROM lignedecommande WHERE id_commande = 3 AND id_produit = 2;

-- vérifier le total de la commande modifiée en exécutant la requête suivante :
SELECT * FROM commande WHERE id = 3;

SELECT l.id_commande, p.id AS id_produit, p.designation AS designation_produit, l.quantite, l.prix
FROM lignedecommande l
JOIN produit p ON l.id_produit = p.id
WHERE l.id_commande = 3;
