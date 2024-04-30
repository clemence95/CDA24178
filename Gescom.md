## Dictionnaire de données

### Suppliers
| Colonne       | Type          | Contraintes                 | Description                   |
|---------------|---------------|-----------------------------|-------------------------------|
| Id_Suppliers  | INT           | PRIMARY KEY, AUTO_INCREMENT | Identifiant du fournisseur    |
| sup_name      | VARCHAR(50)   | NOT NULL                    | Nom du fournisseur            |
| sup_city      | VARCHAR(50)   | NOT NULL                    | Ville du fournisseur          |
| sup_address   | VARCHAR(150)  | NOT NULL                    | Adresse du fournisseur        |
| sup_mail      | VARCHAR(75)   |                             | Adresse e-mail du fournisseur |
| sup_phone     | VARCHAR(15)   |                             | Téléphone du fournisseur      |

### Customers
| Colonne       | Type          | Contraintes                 | Description              |
|---------------|---------------|-----------------------------|--------------------------|
| Id_Customers  | INT           | PRIMARY KEY, AUTO_INCREMENT | Identifiant du client    |
| cus_lastname  | VARCHAR(50)   | NOT NULL                    | Nom du client            |
| cus_firstname | VARCHAR(50)   | NOT NULL                    | Prénom du client         |
| cus_address   | VARCHAR(150)  | NOT NULL                    | Adresse du client        |
| cus_zipcode   | VARCHAR(5)    |                             | Code postal du client    |
| cus_city      | VARCHAR(50)   | NOT NULL                    | Ville du client          |
| cus_mail      | VARCHAR(75)   |                             | Adresse e-mail du client |
| cus_phone     | VARCHAR(15)   |                             | Téléphone du client      |

### Orders
| Colonne           | Type          | Contraintes                       | Description                   |
|-------------------|---------------|-----------------------------------|-------------------------------|
| Id_Orders         | INT           | PRIMARY KEY, AUTO_INCREMENT       | Identifiant de la commande    |
| ord_order_date    | DATE          | NOT NULL                          | Date de commande              |
| ord_ship_date     | DATE          |                                   | Date d'expédition             |
| ord_bill_date     | DATE          |                                   | Date de facturation           |
| ord_reception_date| DATE          |                                   | Date de réception             |
| ord_status        | VARCHAR(25)   | NOT NULL                          | Statut de la commande         |
| Id_Customers      | INT           | NOT NULL, FOREIGN KEY (Customers) | Identifiant du client associé |

### Categories
| Colonne       | Type          | Contraintes                 | Description                 |
|---------------|---------------|-----------------------------|-----------------------------|
| Id_Categories | INT           | PRIMARY KEY, AUTO_INCREMENT | Identifiant de la catégorie |
| cat_name      | VARCHAR(200)  | NOT NULL                    | Nom de la catégorie         |
| cat_parent_id | INT           |                             | ID de la catégorie parente  |

### Products
| Colonne           | Type          | Contraintes                        | Description                          |
|-------------------|---------------|------------------------------------|--------------------------------------|
| Id_Products       | INT           | PRIMARY KEY, AUTO_INCREMENT        | Identifiant du produit               |
| pro_ref           | VARCHAR(10)   | NOT NULL                           | Référence du produit                 |
| pro_name          | VARCHAR(200)  | NOT NULL                           | Nom du produit                       |
| pro_desc          | TEXT          |                                    | Description du produit               |
| pro_price         | DECIMAL(6,2)  | NOT NULL                           | Prix du produit                      |
| pro_stock         | SMALLINT      |                                    | Stock du produit                     |
| pro_color         | VARCHAR(30)   |                                    | Couleur du produit                   |
| pro_picture       | VARCHAR(40)   |                                    | Photo du produit                     |
| pro_add_date      | DATE          | NOT NULL                           | Date d'ajout du produit              |
| pro_update_date   | DATETIME      | NOT NULL                           | Date de mise à jour du produit       |
| pro_publish       | TINYINT       | NOT NULL                           | État de publication du produit       |
| Id_Suppliers      | INT           | NOT NULL, FOREIGN KEY (Suppliers)  | Identifiant du fournisseur associé   |
| Id_Categories     | INT           | NOT NULL, FOREIGN KEY (Categories) | Identifiant de la catégorie associée |

### Details
| Colonne       | Type          | Contraintes                       | Description                         |
|---------------|---------------|-----------------------------------|-------------------------------------|
| Id_details    | INT           | PRIMARY KEY, AUTO_INCREMENT       | Identifiant du détail de commande   |
| det_price     | DECIMAL(6,2)  | NOT NULL                          | Prix du détail de commande          |
| det_quantity  | INT           |                                   | Quantité du détail de commande      |
| Id_Products   | INT           | NOT NULL, FOREIGN KEY (Products)  | Identifiant du produit associé      |
| Id_Orders     | INT           | NOT NULL, FOREIGN KEY (Orders)    | Identifiant de la commande associée |




