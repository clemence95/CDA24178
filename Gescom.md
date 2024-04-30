## Dictionnaire de données

### Fournisseurs
| Champ        | Description              | Type        |
|--------------|--------------------------|-------------|
| sup_id       | ID du fournisseur        | INT         |
| sup_name     | Nom du fournisseur       | VARCHAR(50) |
| sup_city     | Ville du fournisseur     | VARCHAR(50) |
| sup_address  | Adresse du fournisseur   | VARCHAR(150)|
| sup_mail     | Email du fournisseur     | VARCHAR(75) |
| sup_phone    | Téléphone du fournisseur | INT(10)     |

### Clients
| Champ          | Description           | Type        |
|----------------|-----------------------|-------------|
| cus_id         | ID du client          | INT         |
| cus_lastname   | Nom du client         | VARCHAR(50) |
| cus_firstname  | Prénom du client      | VARCHAR(50) |
| cus_address    | Adresse du client     | VARCHAR(150)|
| cus_zipcode    | Code postal du client | VARCHAR(5)  |
| cus_city       | Ville du client       | VARCHAR(50) |
| cus_mail       | Email du client       | VARCHAR(75) |
| cus_phone      | Téléphone du client   | INT(10)     |

### Commandes
| Champ             | Description                 | Type       |
|-------------------|-----------------------------|------------|
| ord_id            | ID de la commande           | INT        |
| ord_order_date    | Date de la commande         | DATE       |
| ord_ship_date     | Date d'envoi de la commande | DATE       |
| ord_bill_date     | Date de facturation         | DATE       |
| ord_reception_date| Date de réception           | DATE       |
| ord_status        | Statut de la commande       | VARCHAR(25)|

### Catégories
| Champ          | Description                  | Type        |
|----------------|------------------------------|-------------|
| cat_id         | ID de la catégorie           | INT         |
| cat_name       | Nom de la catégorie          | VARCHAR(200)|
| cat_parent_id  | ID de la catégorie parent    | INT         |

### Produits
| Champ            | Description                        | Type         |
|------------------|------------------------------------|--------------|
| pro_id           | ID du produit                      | INT          |
| pro_ref          | Référence du produit               | VARCHAR(10)  |
| pro_name         | Nom du produit                     | VARCHAR(200) |
| pro_desc         | Description du produit             | TEXT(1000)   |
| pro_price        | Prix du produit                    | DECIMAL(6,2) |
| pro_stock        | Stock du produit                   | SMALLINT(4)  |
| pro_color        | Couleur de l'article               | VARCHAR(30)  |
| pro_picture      | Photo de l'article                 | VARCHAR(40)  |
| pro_add_date     | Date d'ajout du produit            | DATE         |
| pro_update_date  | Date de mise à jour du produit     | DATETIME     |
| pro_publish      | État de publication du produit     | TINYINT(1)   |

### Détails de commande
| Champ         | Description                  | Type        |
|---------------|------------------------------|-------------|
| det_id        | ID de la ligne de commande   | INT         |
| det_price     | Prix unitaire                | DECIMAL(6,2)|
| det_quantity  | Quantité commandée           | INT(5)      |
