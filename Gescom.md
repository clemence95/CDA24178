## Dictionnaire de données

### Suppliers
| Champ         | Description           | Type          | Contraintes                 |
|---------------|-----------------------|---------------|-----------------------------|
| Id_Suppliers  | ID du fournisseur     | INT           | PRIMARY KEY, AUTO_INCREMENT |
| sup_name      | Nom du fournisseur    | VARCHAR(50)   | NOT NULL                    |
| sup_city      | Ville du fournisseur  | VARCHAR(50)   | NOT NULL                    |
| sup_address   | Adresse du fournisseur| VARCHAR(150)  | NOT NULL                    |
| sup_mail      | Mail du fournisseur   | VARCHAR(75)   |                             |
| sup_phone     | Téléphone fournisseur| VARCHAR(15)    |                             |

### Customers
| Champ          | Description          | Type          | Contraintes                 |
|----------------|----------------------|---------------|-----------------------------|
| Id_Customers   | ID du client         | INT           | PRIMARY KEY, AUTO_INCREMENT |
| cus_lastname   | Nom du client        | VARCHAR(50)   | NOT NULL                    |
| cus_firstname  | Prénom du client     | VARCHAR(50)   | NOT NULL                    |
| cus_address    | Adresse du client    | VARCHAR(150)  | NOT NULL                    |
| cus_zipcode    | Code postal client   | VARCHAR(5)    |                             |
| cus_city       | Ville du client      | VARCHAR(50)   | NOT NULL                    |
| cus_mail       | Mail du client       | VARCHAR(75)   |                             |
| cus_phone      | Téléphone du client  | VARCHAR(15)   |                             |

### Categories
| Champ           | Description            | Type          | Contraintes                 |
|-----------------|------------------------|---------------|-----------------------------|
| Id_Categories   | ID de la catégorie     | INT           | PRIMARY KEY, AUTO_INCREMENT |
| cat_name        | Nom de la catégorie    | VARCHAR(200)  | NOT NULL                    |
| cat_parent_id   | ID de la catégorie mère| INT           |                             |

### Products
| Champ             | Description                          | Type          | Contraintes                 |
|-------------------|--------------------------------------|---------------|-----------------------------|
| Id_Products       | ID du produit                        | INT           | PRIMARY KEY, AUTO_INCREMENT |
| pro_ref           | Référence du produit                 | VARCHAR(10)   | NOT NULL                    |
| pro_name          | Nom du produit                       | VARCHAR(200)  | NOT NULL                    |
| pro_desc          | Description du produit               | TEXT          |                             |
| pro_price         | Prix du produit                      | DECIMAL(6,2)  | NOT NULL                    |
| pro_stock         | Nombre de produit en stock           | SMALLINT      |                             |
| pro_color         | Couleur de l'article                 | VARCHAR(30)   |                             |
| pro_picture       | Photo de l'article                   | VARCHAR(40)   |                             |
| pro_add_date      | Date d'ajout du produit              | DATE          | NOT NULL                    |
| pro_update_date   | Date de mise à jour de la fiche      | DATETIME      | NOT NULL                    |
| pro_publish       | État de publication de la fiche      | TINYINT       | NOT NULL                    |
| Id_Suppliers      | ID du fournisseur associé            | INT           | FOREIGN KEY                 |
| Id_Categories     | ID de la catégorie associée          | INT           | FOREIGN KEY                 |

### Orders
| Champ               | Description                           | Type          | Contraintes                 |
|---------------------|---------------------------------------|---------------|-----------------------------|
| Id_Orders           | ID de la commande                     | INT           | PRIMARY KEY, AUTO_INCREMENT |
| ord_order_date      | Date de la commande                   | DATE          | NOT NULL                    |
| ord_ship_date       | Date d'envoi de la commande           | DATE          |                             |
| ord_bill_date       | Date de facturation                   | DATE          |                             |
| ord_reception_date  | Date de réception de la commande      | DATE          |                             |
| ord_status          | Status de la commande                 | VARCHAR(25)   | NOT NULL                    |
| Id_Products         | ID du produit associé à la commande   | INT           | FOREIGN KEY                 |
| Id_Customers        | ID du client associé à la commande    | INT           | FOREIGN KEY                 |

### details (OrderDetails)
| Champ             | Description                         | Type          | Contraintes                 |
|-------------------|-------------------------------------|---------------|-----------------------------|
| Id_details        | ID de la ligne de commande          | INT           | PRIMARY KEY, AUTO_INCREMENT |
| det_price         | Prix de vente du produit            | DECIMAL(6,2)  | NOT NULL                    |
| det_quantity      | Quantité de produits sur la ligne   | INT           |                             |
| Id_Products       | ID du produit associé               | INT           | FOREIGN KEY                 |
| Id_Orders         | ID de la commande associée          | INT           | FOREIGN KEY                 |



