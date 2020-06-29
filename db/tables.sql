
CREATE DATABASE `Tiki`;
USE `Tiki`;


CREATE TABLE `typeProd`(
	`type` varchar(40),
	PRIMARY KEY (type)
);

CREATE TABLE `productModel` (
   `id` int UNIQUE NOT NULL AUTO_INCREMENT ,
   `name` varchar(40),
   `description` varchar(1000),
   `status`	varchar(50),
   `detailedInfo` varchar(1000),
   `brand`	char(10),
   `type` varchar(40),
   FOREIGN KEY (type) REFERENCES typeProd(type),   
   PRIMARY KEY(id)   
);
CREATE TABLE `colorProd`(
      `color`varchar(40),
      `id_Prod` int UNIQUE not NULL AUTO_INCREMENT ,
      FOREIGN KEY(id_Prod) REFERENCES productModel(id)
);

CREATE  TABLE `storage`( 
      `id` int UNIQUE NOT NULL AUTO_INCREMENT,
      `name` varchar(40),
      `address` varchar(255), 
      `producerID`int UNIQUE  NOT NULL 
);

CREATE TABLE `product`(
      `id` int UNIQUE  NOT NULL AUTO_INCREMENT ,
      `STT`int UNIQUE NOT NULL  ,
      `idStorage` int UNIQUE NOT NULL ,
      `stock_in_date` DATE not NULL ,
      `stock_out_date` DATE,
      FOREIGN KEY(idStorage) REFERENCES storage(id)
);





--