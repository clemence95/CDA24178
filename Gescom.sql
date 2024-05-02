-- Suppression de la base de données si elle existe déjà
DROP DATABASE IF EXISTS Gescom;

-- Création de la base de données
CREATE DATABASE Gescom;

-- Sélection de la base de données créée
USE Gescom;

-- Créer la table Suppliers
CREATE TABLE Suppliers(
   Id_Suppliers INT AUTO_INCREMENT,
   sup_name VARCHAR(50) NOT NULL,
   sup_city VARCHAR(50) NOT NULL,
   sup_address VARCHAR(150) NOT NULL,
   sup_mail VARCHAR(75),
   sup_phone VARCHAR(15),
   PRIMARY KEY(Id_Suppliers)
);

-- Créer la table Customers
CREATE TABLE Customers(
   Id_Customers INT AUTO_INCREMENT,
   cus_lastname VARCHAR(50) NOT NULL,
   cus_firstname VARCHAR(50) NOT NULL,
   cus_address VARCHAR(150) NOT NULL,
   cus_zipcode VARCHAR(5),
   cus_city VARCHAR(50) NOT NULL,
   cus_countries VARCHAR(50),
   cus_mail VARCHAR(75),
   cus_phone VARCHAR(15),
   PRIMARY KEY(Id_Customers)
);


-- Import des données depuis le fichier CSV dans la table Customers
LOAD DATA LOCAL INFILE '/home/cb/Téléchargements/customers.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(cus_lastname, cus_firstname, cus_address, cus_zipcode, cus_city, cus_countries, cus_mail, cus_phone);

-- Créer la table Orders
CREATE TABLE Orders(
   Id_Orders INT AUTO_INCREMENT,
   ord_order_date DATE NOT NULL,
   ord_ship_date DATE,
   ord_bill_date DATE,
   ord_reception_date DATE,
   ord_status VARCHAR(25) NOT NULL,
   Id_Customers INT NOT NULL,
   PRIMARY KEY(Id_Orders),
   FOREIGN KEY(Id_Customers) REFERENCES Customers(Id_Customers)
);

-- Créer la table Categories
CREATE TABLE Categories(
   Id_Categories INT AUTO_INCREMENT,
   cat_name VARCHAR(200) NOT NULL,
   cat_parent_id INT,
   PRIMARY KEY(Id_Categories)
);

-- Créer la table Products
CREATE TABLE Products(
   Id_Products INT AUTO_INCREMENT,
   pro_ref VARCHAR(10) NOT NULL,
   pro_name VARCHAR(200) NOT NULL,
   pro_desc TEXT,
   pro_price DECIMAL(6,2) NOT NULL,
   pro_stock SMALLINT,
   pro_color VARCHAR(30),
   pro_picture VARCHAR(40),
   pro_add_date DATE NOT NULL,
   pro_update_date DATETIME NOT NULL,
   pro_publish TINYINT NOT NULL,
   Id_Suppliers INT NOT NULL,
   Id_Categories INT NOT NULL,
   PRIMARY KEY(Id_Products),
   FOREIGN KEY(Id_Suppliers) REFERENCES Suppliers(Id_Suppliers),
   FOREIGN KEY(Id_Categories) REFERENCES Categories(Id_Categories)
);

-- Créer la table details
CREATE TABLE details(
   Id_details INT AUTO_INCREMENT,
   det_price DECIMAL(6,2) NOT NULL,
   det_quantity INT,
   Id_Products INT NOT NULL,
   Id_Orders INT NOT NULL,
   PRIMARY KEY(Id_details),
   FOREIGN KEY(Id_Products) REFERENCES Products(Id_Products),
   FOREIGN KEY(Id_Orders) REFERENCES Orders(Id_Orders)
);

-- Créer un index sur la colonne pro_ref de la table Products
CREATE INDEX idx_pro_ref ON Products(pro_ref);

-- Ajouter une catégorie
INSERT INTO Categories (cat_name, cat_parent_id) VALUES ('Électronique', NULL);

-- Récupérer l'ID de la catégorie insérée
SET @parent_cat_id = LAST_INSERT_ID();

-- Ajouter deux sous-catégories
INSERT INTO Categories (cat_name, cat_parent_id) VALUES ('Téléphones', @parent_cat_id);
INSERT INTO Categories (cat_name, cat_parent_id) VALUES ('Ordinateurs', @parent_cat_id);

-- Récupérer les ID des sous-catégories insérées
SET @phone_cat_id = LAST_INSERT_ID();
SET @computer_cat_id = LAST_INSERT_ID();

-- Ajouter un fournisseur
INSERT INTO Suppliers (sup_name, sup_city, sup_address, sup_mail, sup_phone) VALUES ('Fournisseur A', 'Ville A', 'Adresse A', 'fournisseurA@example.com', '123456789');

-- Récupérer l'ID du fournisseur inséré
SET @supplier_id = LAST_INSERT_ID();

-- Ajouter trois produits dans la sous-catégorie Téléphones
INSERT INTO Products (pro_ref, pro_name, pro_desc, pro_price, pro_stock, pro_color, pro_picture, pro_add_date, pro_update_date, pro_publish, Id_Suppliers, Id_Categories) 
VALUES 
('TEL001', 'iPhone 12', 'Nouveau téléphone d\'Apple', 999.99, 100, 'Noir', 'iphone12.jpg', CURDATE(), NOW(), 1, @supplier_id, @phone_cat_id),
('TEL002', 'Samsung Galaxy S21', 'Dernier modèle de Samsung', 899.99, 150, 'Bleu', 'galaxys21.jpg', CURDATE(), NOW(), 1, @supplier_id, @phone_cat_id),
('TEL003', 'Google Pixel 5', 'Smartphone haut de gamme de Google', 799.99, 120, 'Blanc', 'pix5.jpg', CURDATE(), NOW(), 1, @supplier_id, @phone_cat_id);

-- Ajouter trois produits dans la sous-catégorie Ordinateurs
INSERT INTO Products (pro_ref, pro_name, pro_desc, pro_price, pro_stock, pro_color, pro_picture, pro_add_date, pro_update_date, pro_publish, Id_Suppliers, Id_Categories) 
VALUES 
('COM001', 'MacBook Pro', 'Ordinateur portable d\'Apple', 1499.99, 50, 'Gris', 'macbookpro.jpg', CURDATE(), NOW(), 1, @supplier_id, @computer_cat_id),
('COM002', 'Dell XPS 15', 'PC portable puissant de Dell', 1299.99, 80, 'Noir', 'xps15.jpg', CURDATE(), NOW(), 1, @supplier_id, @computer_cat_id),
('COM003', 'Lenovo ThinkPad X1 Carbon', 'PC portable léger et performant de Lenovo', 1399.99, 60, 'Gris', 'thinkpad.jpg', CURDATE(), NOW(), 1, @supplier_id, @computer_cat_id);





