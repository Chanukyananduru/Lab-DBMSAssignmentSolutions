
create database ecommerce;
use ecommerce;
CREATE TABLE IF NOT EXISTS `supplier` (
  `SUPP_ID` INT NOT NULL,	
  `SUPP_NAME`VARCHAR(50) NOT NULL, 
  `SUPP_CITY`VARCHAR(50) NOT NULL, 
  `SUPP_PHONE`VARCHAR(10) NOT NULL, 
  PRIMARY KEY (`SUPP_ID`));
  
  CREATE TABLE IF NOT EXISTS `customer` (
  `CUS_ID` INT NOT NULL,	
  `CUS_NAME`VARCHAR(20) NOT NULL, 
  `CUS_PHONE`VARCHAR(10) NOT NULL, 
  `CUS_CITY`VARCHAR(30) NOT NULL, 
  `CUS_GENDER`CHAR NOT NULL, 
  PRIMARY KEY (`CUS_ID`));
  
   CREATE TABLE IF NOT EXISTS `category` (
  `CAT_ID` INT NOT NULL,	
  `CAT_NAME`VARCHAR(20) NOT NULL, 
  PRIMARY KEY (`CAT_ID`));

CREATE TABLE IF NOT EXISTS `product` (
  `PRO_ID` INT NOT NULL,	
  `PRO_NAME`VARCHAR(20) NOT NULL DEFAULT 'DUMMY', 
  `PRO_DESC`VARCHAR(60), 
  `CAT_ID` INT NOT NULL,
  PRIMARY KEY (`PRO_ID`),
  FOREIGN KEY (`CAT_ID`)
REFERENCES `category` (`CAT_ID`));

CREATE TABLE IF NOT EXISTS `supplier_pricing` (
  `PRICING_ID` INT NOT NULL,	
  `PRO_ID` INT NOT NULL,
  `SUPP_ID` INT NOT NULL,
  `SUPP_PRICE` INT NOT NULL,
  PRIMARY KEY (`PRICING_ID`),
  FOREIGN KEY (`SUPP_ID`)
REFERENCES `supplier` (`SUPP_ID`),
  FOREIGN KEY (`PRO_ID`)
REFERENCES `product` (`PRO_ID`));

CREATE TABLE IF NOT EXISTS `orders` (
  `ORD_ID` INT NOT NULL,	
  `ORD_AMOUNT` INT NOT NULL,
  `ORD_DATE` DATE NOT NULL,
  `CUS_ID` INT NOT NULL,	
  `PRICING_ID` INT NOT NULL,
  PRIMARY KEY (`ORD_ID`),
  FOREIGN KEY (`CUS_ID`)
REFERENCES `customer` (`CUS_ID`),
  FOREIGN KEY (`PRICING_ID`)
REFERENCES `supplier_pricing` (`PRICING_ID`));

CREATE TABLE IF NOT EXISTS `rating` (
  `RAT_ID` INT NOT NULL,	
  `ORD_ID` INT NOT NULL,
  `RAT_RATSTARS` INT NOT NULL,
  PRIMARY KEY (`RAT_ID`),
  FOREIGN KEY (`ORD_ID`)
REFERENCES `orders` (`ORD_ID`));

INSERT INTO supplier VALUES (1,'Rajesh Retails','Delhi', 1234567890);
INSERT INTO supplier VALUES (2,'Appraio Ltd.','Mumbai', 2589631470);
INSERT INTO supplier VALUES (3,'Knome products','Bangalore', 9785462315);
INSERT INTO supplier VALUES (4,'Bansal Retails','Kochi', 8975463285);
INSERT INTO supplier VALUES (5,'Mittal Ltd.','Lucknow', 7898456532);
select * from supplier;

INSERT INTO customer VALUES (1,'AAKASH', 9999999999,'DELHI','M');
INSERT INTO customer VALUES (2,'AMAN', 9785463215,'NOIDA','M');
INSERT INTO customer VALUES (3,'NEHA', 9999999999,'MUMBAI','F');
INSERT INTO customer VALUES (4,'MEGHA', 9994562399,'KOLKATA','F');
INSERT INTO customer VALUES (5,'PULKIT', 7895999999,'LUCKNOW','M');
select * from customer;

INSERT INTO category VALUES (1,'BOOKS');
INSERT INTO category VALUES (2,'GAMES');
INSERT INTO category VALUES (3,'GROCERIES');
INSERT INTO category VALUES (4,'ELECTRONICS');
INSERT INTO category VALUES (5,'CLOTHES');
select * from category;

INSERT INTO product VALUES (1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM', 2);
INSERT INTO product VALUES (2,'TSHIRT','SIZE-L with Black, Blue and White variations', 5);
INSERT INTO product VALUES (3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4);
INSERT INTO product VALUES (4,'OATS','Highly Nutritious from Nestle', 3);
INSERT INTO product VALUES (5,'HARRY POTTER','Best Collection of all time by J.K Rowling', 1);
INSERT INTO product VALUES (6,'MILK','1L Toned Milk', 3);
INSERT INTO product VALUES (7,'Boat Earphones','1.5Meter long Dolby Atmos', 4);
INSERT INTO product VALUES (8,'Jeans','Stretchable Denim Jeans with various sizes and color', 5);
INSERT INTO product VALUES (9,'Project IGI','compatible with windows 7 and above', 2);
INSERT INTO product VALUES (10,'Hoodie','Black GUCCI for 13 yrs and above', 5);
INSERT INTO product VALUES (11,'Rich Dad Poor Dad','Written by Robert Kiyosaki', 1);
INSERT INTO product VALUES (12,'Train Your Brain','By Shireen Stephen', 1);
select * from product;


INSERT INTO supplier_pricing VALUES (1,1,2,1500);
INSERT INTO supplier_pricing VALUES (2,3,5,30000);
INSERT INTO supplier_pricing VALUES (3,5,1,3000);
INSERT INTO supplier_pricing VALUES (4,2,3,2500);
INSERT INTO supplier_pricing VALUES (5,4,1,1000);
INSERT INTO supplier_pricing VALUES (6,12,2,780);
INSERT INTO supplier_pricing VALUES (7,12,4,789);
INSERT INTO supplier_pricing VALUES (8,3,1,31000);
INSERT INTO supplier_pricing VALUES (9,1,5,1450);
INSERT INTO supplier_pricing VALUES (10,4,2,999);
INSERT INTO supplier_pricing VALUES (11,7,3,549);
INSERT INTO supplier_pricing VALUES (12,7,4,529);
INSERT INTO supplier_pricing VALUES (13,6,2,105);
INSERT INTO supplier_pricing VALUES (14,6,1,99);
INSERT INTO supplier_pricing VALUES (15,2,5,2999);
INSERT INTO supplier_pricing VALUES (16,5,2,2999);
select * from supplier_pricing;

INSERT INTO orders VALUES (101,1500,'2021-10-06',2,1);
INSERT INTO orders VALUES (102,1000,'2021-10-12',3,5);
INSERT INTO orders VALUES (103,30000,'2021-09-16',5,2);
INSERT INTO orders VALUES (104,1500,'2021-10-05',1,1);
INSERT INTO orders VALUES (105,3000,'2021-08-16',4,3);
INSERT INTO orders VALUES (106,1450,'2021-08-18',1,9);
INSERT INTO orders VALUES (107,789,'2021-09-01',3,7);
INSERT INTO orders VALUES (108,780,'2021-09-07',5,6);
INSERT INTO orders VALUES (109,3000,'2021-09-08',5,3);
INSERT INTO orders VALUES (110,2500,'2021-09-10',2,4);
INSERT INTO orders VALUES (111,1000,'2021-09-15',4,5);
INSERT INTO orders VALUES (112,789,'2021-09-16',4,7);
INSERT INTO orders VALUES (113,31000,'2021-09-16',1,8);
INSERT INTO orders VALUES (114,1000,'2021-09-16',3,5);
INSERT INTO orders VALUES (115,3000,'2021-09-16',5,3);
INSERT INTO orders VALUES (116,99,'2021-09-17',2,14);
select * from orders;


INSERT INTO rating VALUES (1,101,4);
INSERT INTO rating VALUES (2,102,3);
INSERT INTO rating VALUES (3,103,1);
INSERT INTO rating VALUES (4,104,2);
INSERT INTO rating VALUES (5,105,4);
INSERT INTO rating VALUES (6,106,3);
INSERT INTO rating VALUES (7,107,4);
INSERT INTO rating VALUES (8,108,4);
INSERT INTO rating VALUES (9,109,3);
INSERT INTO rating VALUES (10,110,5);
INSERT INTO rating VALUES (11,111,3);
INSERT INTO rating VALUES (12,112,4);
INSERT INTO rating VALUES (13,113,2);
INSERT INTO rating VALUES (14,114,1);
INSERT INTO rating VALUES (15,115,1);
INSERT INTO rating VALUES (16,116,0);
select * from rating;

-- 3 answer
select distinct(cus_gender) as Gender, count(cus_id) as No_of_customers	from customer where cus_id in
(select a.cus_id from (select sum(ord_amount)as total_amount,cus_id from orders group by cus_id) as a where a.total_amount>3000)group by cus_gender;
-- 4 answer
select o.ord_id, o.ord_amount, o.ord_date,o.cus_id,o.pricing_id,pri.pro_id,pro.pro_name,pro.pro_desc,pro.cat_id 
from orders as o 
inner join supplier_pricing as pri on o.pricing_id=pri.pricing_id 
inner join product as pro on pri.pro_id = pro.pro_id
where o.cus_id =2;
-- 5 answer
select * from supplier where supp_id in 
(select a.supp_id from 
(select count(pricing_id)as total_product,supp_id from supplier_pricing group by supp_id)as a 
where a.total_product>1);

-- 6 answer
select category.cat_id, category.cat_name, min(product_categorymin.Min_cat_price) as Min_cat_price from category inner join
(select product.cat_id, product.pro_id, product.pro_name, product.pro_Desc,productmin.Min_prod_price as Min_cat_price from product inner join
(select pro_id, min(supp_price) as Min_prod_price from supplier_pricing group by pro_id) as productmin
where product.pro_id = productmin.pro_id)as product_categorymin
where category.cat_id = product_categorymin.cat_id
group by product_categorymin.cat_id
order by product_categorymin.cat_id asc;

-- 7 answer
select pro.pro_id,pro.pro_name,o.ord_date
from orders o,supplier_pricing pri, product pro 
where o.pricing_id = pri.pricing_id
and pri.pro_id=pro.pro_id
and o.ord_date>'2021-10-05';

-- 8 answer
select cus_name,cus_gender from customer where cus_name like '%A' or cus_name like 'A%';

-- 9 answer
DELIMITER &&  
CREATE PROCEDURE rating()
BEGIN
SELECT s.supp_id,s.supp_name, avg(r.rat_ratstars),
CASE
    WHEN avg(r.rat_ratstars) =5 THEN 'Excellent service'
    WHEN avg(r.rat_ratstars)>4 THEN 'Good service'
    WHEN avg(r.rat_ratstars)>2 THEN 'Average service'
    ELSE 'Poor service'
END AS Type_of_service
FROM supplier s,orders o, rating r, supplier_pricing pri 
where  o.ord_id = r.ord_id
and o.pricing_id = pri.pricing_id
and pri.supp_id = s.supp_id
group by supp_id;
END&&
DELIMITER ;  	

call rating();


-- Rough work...Please ignore
select * from orders where cus_id=2;
select sum(ord_amount)as total_amount,cus_id from orders group by cus_id;
select sum(b.ord_amount)as total_amount,b.cus_id from orders as b group by b.cus_id;
select a.cus_id,a.total_amount from (select sum(ord_amount)as total_amount,cus_id from orders group by cus_id) as a where a.total_amount>3000;
select * from supplier;
select a.supp_id from (select count(pricing_id)as total_product,supp_id from supplier_pricing group by supp_id)as a where a.total_product>1;
select * from orders;
select * from orders where ord_date>'2021-10-05';
select * from product;

SELECT pri.supp_id,s.supp_id,pri.pricing_id,s.supp_name, o.ord_id, r.rat_ratstars,
CASE
    WHEN r.rat_ratstars =5 THEN 'Excellent service'
    WHEN r.rat_ratstars>4 THEN 'Good service'
    WHEN r.rat_ratstars>2 THEN 'Average service'
    ELSE 'Poor service'
END AS Type_of_service
FROM supplier s,orders o, rating r, supplier_pricing pri 
where  o.ord_id = r.ord_id
and o.pricing_id = pri.pricing_id
and pri.supp_id = s.supp_id
order by o.ord_id;

select * from supplier where supp_id in (select supp_id from supplier_pricing group by supp_id having count(supp_id)>1) group by supp_id;

select pro.cat_id,cat.cat_name,pro.pro_id,pro.pro_name,pri.supp_price
   from product pro, supplier_pricing pri, category cat
   where pri.pro_id = pro.pro_id
   and pro.cat_id = cat.cat_id
     and pri.supp_price =
     (
       select min(pri.supp_price)
         from product pro
         where pro.pro_id = pri.pro_id
     )order by cat_id asc;




