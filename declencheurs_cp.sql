USE cp;

ALTER TABLE client ENGINE=InnoDB;

DROP TRIGGER IF EXISTS maj_total;

DELIMITER |
CREATE TRIGGER maj_total AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
    DECLARE id_c INT;
    DECLARE tot DOUBLE;
    DECLARE tot_ajuste DOUBLE; -- Total ajusté avec la remise
    DECLARE remise_coef DOUBLE; -- Coefficient de remise
    SET id_c = NEW.id_commande;
    SET remise_coef = (SELECT remise FROM commande WHERE id = id_c); -- Récupérer le coefficient de remise de la commande
    SET tot = (SELECT SUM(prix * quantite) FROM lignedecommande WHERE id_commande = id_c);
        SET tot_ajuste = tot * (1 - remise_coef / 100); -- Appliquer le coefficient de remise au total
    UPDATE commande SET total = tot_ajuste WHERE id = id_c;
    END;

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

-- supprimer le déclencheur maj_total, vous pouvez utiliser la commande suivante :
DROP TRIGGER IF EXISTS maj_total;

SHOW TRIGGERS