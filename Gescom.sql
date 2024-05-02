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
   cus_mail VARCHAR(75),
   cus_phone VARCHAR(15),
   PRIMARY KEY(Id_Customers)
);

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

-- Créer l'utilisateur util1 avec tous les privilèges
CREATE USER 'util1'@'localhost' IDENTIFIED BY 'mot_de_passe';
GRANT ALL PRIVILEGES ON Gescom.* TO 'util1'@'localhost';

-- Créer l'utilisateur util2 avec le privilège de sélection seulement
CREATE USER 'util2'@'localhost' IDENTIFIED BY 'mot_de_passe';
GRANT SELECT ON Gescom.* TO 'util2'@'localhost';

-- Créer l'utilisateur util3 sans aucun privilège, sauf pour la table Customers
CREATE USER 'util3'@'localhost' IDENTIFIED BY 'mot_de_passe';
GRANT SELECT ON Gescom.Customers TO 'util3'@'localhost';
