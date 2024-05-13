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

-- Conclusion : Sans l'instruction COMMIT, les modifications apportées par la transaction
-- ne sont pas définitivement validées dans la base de données.
-- Elles restent en attente jusqu'à ce qu'une instruction COMMIT soit exécutée.

-- Données modifiables par d'autres utilisateurs : Tant que la transaction n'est pas confirmée avec l'instruction COMMIT,
-- les autres utilisateurs ne verront pas les modifications effectuées par la transaction en cours.
-- Cependant, une fois la transaction validée, les modifications deviennent visibles pour tous les utilisateurs.

-- La transaction est-elle terminée ? : La transaction n'est pas terminée tant
-- qu'elle n'est pas confirmée avec l'instruction COMMIT ou annulée avec l'instruction ROLLBACK.

-- Rendre la modification permanente : Pour rendre les modifications permanentes,
-- vous devez exécuter l'instruction COMMIT après avoir effectué les modifications dans la transaction.

--Annuler la transaction : Si vous souhaitez annuler les modifications et revenir à l'état précédent,
-- vous pouvez exécuter l'instruction ROLLBACK pour annuler la transaction en cours.
-- Cela annulera toutes les modifications non validées dans la transaction