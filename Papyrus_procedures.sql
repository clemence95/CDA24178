USE papyrus;

-- procédure stockée Lst_fournis : 
DELIMITER //

CREATE PROCEDURE Lst_fournis()
BEGIN
    SELECT DISTINCT fourn.numfou, fourn.nomfou
    FROM entcom
    JOIN fournis fourn ON entcom.numfou = fourn.numfou;
END //

DELIMITER ;


SHOW CREATE PROCEDURE Lst_fournis;

--  procédure stockée Lst_Commandes : 
DELIMITER //

CREATE PROCEDURE Lst_Commandes(IN obscom_param VARCHAR(50))
BEGIN
    SELECT entcom.numcom AS 'Numéro de commande',
           fourn.nomfou AS 'Nom du fournisseur',
           produit.libart AS 'Libellé du produit',
           ligcom.qteliv AS 'Quantité commandée',
           ligcom.priuni AS 'Prix unitaire',
           (ligcom.qteliv * ligcom.priuni) AS 'Total du produit',
           total_commande.total AS 'Total de la commande'
    FROM entcom
    JOIN fournis AS fourn ON entcom.numfou = fourn.numfou
    JOIN ligcom ON entcom.numcom = ligcom.numcom
    JOIN produit ON ligcom.codart = produit.codart
    JOIN (
        SELECT numcom, SUM(qteliv * priuni) AS total
        FROM ligcom
        GROUP BY numcom
    ) AS total_commande ON entcom.numcom = total_commande.numcom
    WHERE entcom.obscom LIKE CONCAT('%', obscom_param, '%')
    ORDER BY entcom.numcom, fourn.nomfou;
END //

DELIMITER ;


SHOW CREATE PROCEDURE Lst_Commandes;

DROP PROCEDURE `Lst_Commandes`;