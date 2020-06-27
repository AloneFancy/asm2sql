
CREATE DATABASE `Employee`;
USE `Employee`;

CREATE TABLE `typeProd`(
	`type` varchar(40) ,
	PRIMARY KEY (type)
);
CREATE TABLE `productModel` (
   `id` int UNIQUE NOT NULL,
   `name` varchar(40),
   `description` varchar(1000),
   `status`	varchar(50),
   `detailedInfo` varchar(1000),
   `color`	char(10), 	
   `brand`	char(10),
   `type` varchar(40),
   FOREIGN KEY (type) REFERENCES typeProd(type),   
   PRIMARY KEY(id)   
);

INSERT INTO typeProd VALUES
('Giày'),
('Ấm nước')
;

INSERT INTO productModel VALUES
(1,'Giày văn phòng','description','available','detail','nâu','Viettien','Giày'),
(2,'Giày văn phòng','description','available','detail','nâu','Viettien','Giày'),
(3,'Giày văn phòng','description','available','detail','nâu','Viettien','Giày'),
(4,'Giày văn phòng','description','available','detail','nâu','Viettien','Giày'),
(5,'Giày văn phòng','description','available','detail','nâu','Viettien','Giày'),
(6,'Giày văn phòng','description','available','detail','nâu','Viettien','Giày'),
(7,'Giày văn phòng','description','available','detail','nâu','Viettien','Giày'),
(8,'Giày văn phòng','description','available','detail','nâu','Viettien','Giày'),
(9,'Giày văn phòng','description','available','detail','nâu','Viettien','Giày'),
(10,'Giày văn phòng','description','available','detail','nâu','Viettien','Giày'),	
(11,'Ấm điện đun nước 5 lít ấm siêu tốc có còi báo khi sôi tiết kiệm điện',' ','available','Ấm điện đun nước 5 lít ấm siêu tốc có còi báo khi sôi tiết kiệm điện
Công suất: 1500W
Công suất cao đun sôi nước nhanh chỉ trong vòng 15’ cho 5 lít nước
Khi nước sôi, sẽ có còi báo rất thông minh
Dây nguồn rời, ấm điện sử dụng rắc cắm rời, dây dài 1,5 mét. Khi không sử dụng có thể rút ra khỏi ấm
Tuy nhiên: shop khuyên bạn nên cắm cố định dây với phần giác cắm của ấm sẽ tốt hơn
Thân ấm bằng inox ngoại nhập không gây độc hại, quai ấm bằng nhựa chống cháy.
Tiết kiệm điện năng tiêu thụ, ấm có tỷ lệ chuyển đổi điện năng sang nhiệt năng khoảng 98%.','Không màu','Viettien','Ấm nước');


