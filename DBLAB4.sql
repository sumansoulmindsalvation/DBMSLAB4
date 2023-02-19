--  Question 1
create database glpractice;

USE glpractice;

create table supplier(Supp_id int NOT NULL ,Supp_Name Varchar(50) NOT NULL ,Supp_city Varchar(50) NOT NULL,Supp_Phone Varchar(50) NOT NULL, Primary Key (Supp_id)) ;
create table Customer(Cus_id int NOT NULL ,Cus_Name Varchar(20) NOT NULL ,Cus_Phone Varchar(10) NOT NULL,Cus_City Varchar(30) NOT NULL,Cus_Gender Char, Primary Key (Cus_id)) ;

create table Category(Cat_id int NOT NULL ,Cat_Name Varchar(20) NOT NULL , Primary Key (Cat_id)) ;

create table Product(Pro_id int NOT NULL ,Pro_Name Varchar(20) NOT NULL Default "Dummy",Pro_Desc Varchar(60) ,Cat_id int , Primary Key (Pro_id),Foreign Key (Cat_id) References Category(Cat_id)) ;

create table Supplier_pricing(Pricing_id int NOT NULL ,Pro_id int,Supp_id int ,Supp_price int Default 0, Primary Key (Pricing_id),Foreign Key (Pro_id) References Product(Pro_id),Foreign Key (Supp_id) References supplier(Supp_id)) ;

create table Orders(Ord_id int NOT NULL,Ord_Amount int NOT NULL,Ord_Date Date NOT NULL ,Cus_id int ,Pricing_id int, Primary Key (Ord_id),Foreign Key (Cus_id) References Customer(Cus_id),Foreign Key (Pricing_id) References Supplier_pricing (Pricing_id)) ;

create table Rating(Rat_id int NOT NULL ,Ord_id int,Rat_Ratstars int NOT NULL , Primary Key (Rat_id),Foreign Key (Ord_id) References Orders(Ord_id)) ;
-- Que 2
INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");

INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

INSERT INTO Orders VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO Orders VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO Orders VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO Orders VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO Orders VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO Orders VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO Orders VALUES(107,789,"2021-09-01",3,7);
INSERT INTO Orders VALUES(108,780,"2021-09-07",5,6);
INSERT INTO Orders VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO Orders VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO Orders VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO Orders VALUES(112,789,"2021-09-16",4,7);
INSERT INTO Orders VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO Orders VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO Orders VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO Orders VALUES(116,99,"2021-09-17",2,14);

INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);
-- Que 3
select Cus_Gender, count(Cus_Gender) as total from Customer inner join Orders On Orders.Cus_id = Customer.Cus_id where Ord_Amount>=3000 group by Cus_Gender;
-- Que 4
select product.Pro_Name, Orders.* from Orders, supplier_pricing, product where Orders.cus_id=2 and Orders.pricing_id=supplier_pricing.pricing_id and supplier_pricing.pro_id=product.pro_id;
-- Que 5
select supplier.* from supplier where supplier.supp_id in (select supp_id from supplier_pricing group by supp_id having count(supp_id)>1) group by supplier.supp_id;

-- Que 6
select t.Cat_id, t.Cat_Name, min(t.Supp_price)
from (Select Category.Cat_id,Category.Cat_Name,Product.Pro_Name,Supplier_pricing.Supp_price,Product.Pro_id from Supplier_Pricing
 inner join Product 
 on Product.Pro_id = Supplier_pricing.Pro_id  
 inner join Category on Category.Cat_id=Product.Cat_id) as t
 group by t.Cat_id;
-- Que 7
select product.pro_id,product.pro_name from Orders inner join supplier_pricing on supplier_pricing.pricing_id=Orders.pricing_id inner join product on product.pro_id=supplier_pricing.pro_id where Orders.ord_date>"2021-10-05";
-- Que 8
select Cus_Name,Cus_Gender from Customer where Cus_name like '%A' or Cus_name like 'A%'

-- Que 9
DELIMITER //
CREATE PROCEDURE Rate()
begin
select supplier.supp_id, supplier.supp_name, rating.rat_ratstars, 
CASE 
when (rating.rat_ratstars) >=5
then "excellent"
when (rating.rat_ratstars) <5 and (rating.rat_ratstars)>=4
then "good Service"
when (rating.rat_ratstars)<4 and (rating.rat_ratstars)>2
then "Average service"
else "poorservice"
end as Type_of_Service  from rating 
inner join Orders
on Orders.ord_id=rating.ord_id
inner join supplier_pricing
on supplier_pricing.pricing_id= Orders.pricing_id
inner join supplier
on supplier.supp_id= supplier_pricing.supp_id ;
end //
DELIMITER ;
	





