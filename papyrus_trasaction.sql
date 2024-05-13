USE papyrus;
START TRANSACTION;

SELECT nomfou FROM fournis WHERE numfou=120;

UPDATE fournis SET nomfou = 'GROSBRIGAND' WHERE numfou = 120;

SELECT nomfou FROM fournis WHERE numfou=120;

-- Pour rendre les modifications permanentes
COMMIT;

-- Ou pour annuler les modifications
 ROLLBACK;

SELECT nomfou FROM fournis WHERE numfou = 120;
