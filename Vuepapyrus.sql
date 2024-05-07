use papyrus;
-- Créer la vue v_GlobalCde correspondant à la requête :
CREATE VIEW v_GlobalCde AS
SELECT codart, 
       SUM(qtecde) AS QteTot, 
       SUM(qtecde * priuni) AS PrixTot
FROM ligcom
GROUP BY codart;

SELECT * FROM v_GlobalCde;

-- Créer la vue v_VentesI100 correspondant à la requête :
CREATE VIEW v_VentesI100 AS
SELECT *
FROM vente
WHERE codart = 'I100';

SELECT * FROM v_VentesI100

-- Créer la vue v_VentesI100Grobrigan à partir de la vue précédente :
CREATE VIEW v_VentesI100Grobrigan AS
SELECT *
FROM v_VentesI100
WHERE numfou = 120;

SELECT * FROM v_VentesI100Grobrigan
