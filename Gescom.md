## Dictionnaire de données

### Fournisseurs
| Champ        | Description              | Type         | Contraintes    |
|--------------|--------------------------|--------------|----------------|
| **sup_id**   | ID du fournisseur        | INT          | NOT NULL       |
| sup_name     | Nom du fournisseur       | VARCHAR(50)  | NOT NULL       |
| sup_city     | Ville du fournisseur     | VARCHAR(50)  | NOT NULL       |
| sup_address  | Adresse du fournisseur   | VARCHAR(150) | NOT NULL       |
| sup_mail     | Email du fournisseur     | VARCHAR(75)  |                |
| sup_phone    | Téléphone du fournisseur | VARCHAR(15)  |                |

### Clients
| Champ          | Description           | Type        | Contraintes    |
|----------------|-----------------------|-------------|----------------|
| **cus_id**     | ID du client          | INT         | NOT NULL       |
| cus_lastname   | Nom du client         | VARCHAR(50) | NOT NULL       |
| cus_firstname  | Prénom du client      | VARCHAR(50) | NOT NULL       |
| cus_address    | Adresse du client     | VARCHAR(150)| NOT NULL       |
| cus_zipcode    | Code postal du client | VARCHAR(5)  |                |
| cus_city       | Ville du client       | VARCHAR(50) | NOT NULL       |
| cus_mail       | Email du client       | VARCHAR(75) |                |
| cus_phone      | Téléphone du client   | VARCHAR(15) |                |

### Commandes
| Champ             | Description                  | Type       | Contraintes    |
|-------------------|------------------------------|------------|----------------|
| **ord_id**        | ID de la commande            | INT        | NOT NULL       |
| ord_order_date    | Date de la commande          | DATE       | NOT NULL       |
| ord_ship_date     | Date d'envoi de la commande  | DATE       |                |
| ord_bill_date     | Date de facturation          | DATE       |                |
| ord_reception_date| Date de réception            | DATE       |                |
| ord_status        | Statut de la commande        | VARCHAR(25)| NOT NULL       |
| *cus_id*          | ID du client (Clé étrangère) | INT        |                |

### Catégories
| Champ          | Description                  | Type               | Contraintes    |
|----------------|------------------------------|--------------------|----------------|
| **cat_id**     | ID de la catégorie           | INT                | NOT NULL       |
| cat_name       | Nom de la catégorie          | VARCHAR(200)       | NOT NULL       |
| cat_parent_id  | ID de la catégorie parent    | INT Entier(32)Bits |                |

### Produits
| Champ            | Description                        | Type                       | Contraintes    |
|------------------|------------------------------------|----------------------------|----------------|
| **pro_id**       | ID du produit                      | INT                        | NOT NULL       |
| pro_ref          | Référence du produit               | VARCHAR(10)                | NOT NULL       |
| pro_name         | Nom du produit                     | VARCHAR(200)               | NOT NULL       |
| pro_desc         | Description du produit             | TEXT(1000) (Volumineux)    |                |
| pro_price        | Prix du produit                    | DECIMAL(6,2)               | NOT NULL       |
| pro_stock        | Stock du produit                   | SMALLINT(4) Entier(16)Bits |                |
| pro_color        | Couleur de l'article               | VARCHAR(30)                |                |
| pro_picture      | Photo de l'article                 | VARCHAR(40)                |                |
| pro_add_date     | Date d'ajout du produit            | DATE                       | NOT NULL       |
| pro_update_date  | Date de mise à jour du produit     | DATETIME                   | NOT NULL       |
| pro_publish      | État de publication du produit     | TINYINT(1) Entier(8)Bits   | NOT NULL       |
| *cat_id*         | ID de catégorie (Clé étrangère)    | INT                        |                |
| *sup_id*         | ID du fournisseur (Clé étrangère)  | INT                        |                |

### Détails de commande
| Champ         | Description                      | Type                  | Contraintes    |
|---------------|----------------------------------|-----------------------|----------------|
| **det_id**    | ID de la ligne de commande       | INT                   | NOT NULL       |
| det_price     | Prix unitaire                    | DECIMAL(6,2)          | NOT NULL       |
| det_quantity  | Quantité commandée               | INT(5) Entier(32)Bits | NOT NULL       |
| *pro_id*      | ID du produit (Clé étrangère)    | INT                   |                |
| *ord_id*      | ID de la commande (Clé étrangère)| INT                   |                |


