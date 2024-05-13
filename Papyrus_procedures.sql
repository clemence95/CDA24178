USE papyrus;

-- procédure stockée Lst_fournis : 
DELIMITER //

CREATE PROCEDURE Lst_fournis()
BEGIN
    SELECT DISTINCT numfou
    FROM entcom;
END //

DELIMITER ;

SHOW CREATE PROCEDURE Lst_fournis;

--  procédure stockée Lst_Commandes : 

DELIMITER //

CREATE PROCEDURE Lst_Commandes (IN obscom_filter VARCHAR(50))
BEGIN
    -- Instructions SQL pour sélectionner les commandes ayant le libellé particulier
    SELECT *
    FROM entcom
    WHERE obscom = obscom_filter;
END //

DELIMITER ;

SHOW CREATE PROCEDURE Lst_Commandes;

