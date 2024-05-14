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

INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (3, 4, 100, 3);

SELECT * FROM commande WHERE id = 3;



