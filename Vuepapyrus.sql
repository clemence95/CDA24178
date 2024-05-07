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
