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

