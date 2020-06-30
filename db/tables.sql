DROP DATABASE IF EXISTS `Tiki`;
CREATE DATABASE `Tiki`;
USE `Tiki`;

/*PRODUCT TABLES``*/
CREATE TABLE `typeProd`(
	`type`      varchar(40),
	PRIMARY KEY (type)
);

CREATE TABLE `productModel` (
   `id`           int UNIQUE NOT NULL AUTO_INCREMENT ,
   `name`         varchar(40),
   `description`  varchar(1000),
   `status`	      varchar(50),
   `detailedInfo` varchar(1000),
   `brand`	      char(10),
   `type`         varchar(40),
   FOREIGN KEY (type) REFERENCES typeProd(type),   
   PRIMARY KEY(id)   
);
CREATE TABLE `colorProd`(
      `color`     varchar(40),
      `id_Prod`   int ,
      FOREIGN KEY(id_Prod) REFERENCES productModel(id)
);

/*member account*/


CREATE TABLE `member`(
      `email`     VARCHAR (255),
      `phone_num` varchar(255),
      `name`      VARCHAR (255),
      `password`  VARCHAR (511),
      PRIMARY KEY (email)
);

CREATE TABLE `address`(
      `email`     varchar(255),
      `address`   varchar(255),
      FOREIGN KEY (email) REFERENCES member(email)
);

CREATE TABLE `customer`(
      `id`        int UNIQUE NOT  NULL ,
      `gender`    char(6),
      `birthday`  DATE ,
      PRIMARY KEY (id)
);

CREATE TABLE `review`(
      `id_customer`     int UNIQUE ,
      `id_product`      int UNIQUE ,
      `comment`         VARCHAR (65535),
      `date`            DATE ,
      `star`            int, /* From 1 to 5*/
      PRIMARY KEY (id_customer,id_product),
      FOREIGN KEY (id_customer) REFERENCES customer(id)  ,
      FOREIGN KEY (id_product) REFERENCES productModel(id)
);
/*Nhà bán*/
CREATE TABLE `seller`(
      `join_date`       DATE ,
      `business_reg_num`VARCHAR (30),
      `store_name`      VARCHAR (40),
      `type_prod`       varchar(40),
      `id_seller`       int UNIQUE NOT NULL ,
      PRIMARY KEY (id_seller)
);
/*Giá bán*/
CREATE TABLE `price`(
      `id_seller`       int UNIQUE NOT NULL ,
      `id_productModel` int UNIQUE NOT NULL ,
      `price`           int NOT NULL ,
      `start_date`      DATE ,
      `end_date`        DATE ,
      PRIMARY KEY (id_seller,id_productModel,price,start_date,end_date),
      FOREIGN KEY (id_seller) REFERENCES seller(id_seller),
      FOREIGN KEY (id_productModel) REFERENCES  productModel(id)
);

CREATE TABLE `provider`(
      `id_seller`       INT  UNIQUE NOT  NULL ,
      `id_productModel` int UNIQUE NOT NULL ,
      `infoGuarantee`   varchar(255),
      PRIMARY KEY (id_seller,id_productModel)   
);

/*-RECEIPT*/
CREATE TABLE `order`( /*đơn hàng*/
      `id`              INT UNIQUE NOT NULL AUTO_INCREMENT ,
      `payment_method`  varchar (255),
      `destinaton`      varchar (255),
      `date`            DATE ,
      `status`          VARCHAR(255),
      `id_customer`     int,
      PRIMARY KEY (id),
      FOREIGN KEY (id_customer) REFERENCES customer(id)
);

CREATE TABLE `Co_Don_hang_nha_ban_mau_sp`(
      `buy_amount`      int,
      `id_order`        int UNIQUE ,
      `id_productModel` int UNIQUE ,
      `id_seller`       int UNIQUE ,
      PRIMARY KEY (id_order,id_productModel,id_seller)
);


CREATE TABLE `receipt`( /*hóa đơn*/
      `id`                    int UNIQUE AUTO_INCREMENT ,
      `total_products`        int,
      `date`                  DATE ,
      `id_order`           int UNIQUE ,
      `id_customer`        int UNIQUE ,
      `id_staff_incharge`     int UNIQUE ,
      PRIMARY KEY (id),
      /*FOREIGN KEY (id_order) REFERENCES order(id),*/
      FOREIGN KEY (id_customer) REFERENCES customer(id)
);
/*ALTER TABLE `receipt`
ADD CONSTRAINT 	fk_id_order	FOREIGN KEY (id_order) 
				REFERENCES order(id); 
				ON DELETE CASCADE	;	*/    


CREATE TABLE `product_in_receipt`( /*sản phẩm trong hóa đơn*/
      `id_product`      int UNIQUE,
      `STT`             int UNIQUE ,
      `price`           int,
      `id_receipt`      int UNIQUE ,
    /*  FOREIGN KEY (STT) REFERENCES product(STT),*/
      FOREIGN KEY (id_receipt) REFERENCES receipt(id)
);


/* Thùng hàng*/
CREATE TABLE `cargo`(
      `id`              int UNIQUE ,
      `note`            VARCHAR (255),
      `date_packed`     DATE ,
      `date_receive`    DATE ,
      `delivery_staff`  int UNIQUE ,
      `status`          VARCHAR (255),
      PRIMARY KEY (id)
);


/*Nhân viên*/
CREATE TABLE `staff`(
      `id`              int UNIQUE ,
      `phone_num`       varchar(10),
      `name`            VARCHAR (40),
      `gender`          char(6),
      `birthday`        DATE ,
      `address`         VARCHAR (255),
      `id_citizen`      VARCHAR (30),
      PRIMARY KEY (id)
);

CREATE TABLE `order_staff`(   /*nhân viên xử lý hóa đơn*/
      `id`              int UNIQUE ,
      FOREIGN KEY (id) REFERENCES staff(id)
);

CREATE  TABLE `delivery_staff`(
      `id`              int UNIQUE ,
      `vehicle`         varchar(40),
      FOREIGN KEY (id) REFERENCES staff(id)
);

CREATE TABLE `staff_manager`(
      `id_staff`        int UNIQUE NOT NULL ,
      `id_manager`      int UNIQUE NOT NULL,
      `start_date`      DATE ,
      `end_date`        DATE ,
      FOREIGN KEY (id_staff) REFERENCES  staff(id),
      PRIMARY KEY (id_manager)
);


CREATE  TABLE `storage`( 
      `id`              int UNIQUE NOT NULL AUTO_INCREMENT,
      `name`            varchar(40),
      `address`         varchar(255), 
      `producerID`int UNIQUE  NOT NULL 
);

CREATE TABLE `product`(
      `id_product`      int UNIQUE  NOT NULL  ,
      `STT`             int UNIQUE NOT NULL  ,
      `idStorage`       int UNIQUE NOT NULL ,
      `stock_in_date`   DATE not NULL ,
      `stock_out_date`  DATE,
      
      FOREIGN KEY(idStorage) REFERENCES storage(id)
);

/*DEPARTMENT*/

CREATE TABLE  `department`(
      `id`              int UNIQUE NOT NULL AUTO_INCREMENT ,
      `name`            varchar (255),
      `description`     varchar (255), /*mô tả hoạt động*/
      PRIMARY KEY (id)
);

CREATE TABLE `department_manager`(
      `id_staff`        int UNIQUE ,
      `id_department`   int UNIQUE ,
      `start_date`      DATE ,
      `end_date`  DATE ,
      PRIMARY KEY (id_staff,id_department,start_date,end_date)
);

CREATE TABLE `department_place`(
      `id_department`   int UNIQUE ,
      `location`        VARCHAR(255),
      PRIMARY KEY (id_department,location),
      FOREIGN KEY (id_department) REFERENCES department(id)
);

CREATE TABLE `current_working_department`(
      `id_staff`        int UNIQUE ,
      `id_department`   int UNIQUE ,
      `start_date`      DATE ,
      `end_date`        DATE ,
      PRIMARY KEY (id_staff,id_department),
      FOREIGN KEY (id_staff) REFERENCES staff(id) ,
      FOREIGN KEY (id_department) REFERENCES department(id)
);




