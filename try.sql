create database magazine;
use magazine;
create table company(             
companyId INT AUTO_INCREMENT PRIMARY KEY,
companyName VARCHAR(255) NOT NULL,
companyCountry VARCHAR(255) NOT NULL
);
create table phone(
phoneId INT AUTO_INCREMENT PRIMARY KEY,
phoneModel VARCHAR(255) NOT NULL,
companyId INT NOT NULL,
price INT NULL,
FOREIGN KEY (companyId) references company(companyId)
);
insert into company (companyName, companyCountry) values ("Iphone", "USA"), ("Asus", "USA"), ("Google","USA"),("Huawei", "China"), ("Samsung", "South Korea");
select * from company;
insert into phone (phoneModel, companyId, price) values ("Iphone 11", 1, 49990), ("Iphone 12", 1, 64990), 
("Iphone 12 mini", 1, 54990), ("Zenfone 8", 2, 70990), ("ROG Phone 5", 2, 89990), ("P Smart", 4, 15990), 
("Nova 8", 4, 0), ("P40 Lite", 4, 19990), ("Galaxy Z Fold3", 5, 169990), ("Galaxy Note 20", 5, 79990), 
("Galaxy A52", 5, 0);
insert into phone (phoneModel, companyId, price) values ("Iphone 11", 1, 49990), ("Iphone 12", 1, 64990), 
("Iphone 12 mini", 1, 54990),  ("ROG Phone 5", 2, 89990), ("P Smart", 4, 15990),  ("P40 Lite", 4, 19990),  
("Galaxy Note 20", 5, 79990), ("Galaxy A52", 5, 0);
select * from phone;
select company.companyName, phone.phoneModel, phone.price, count(phone.phoneId), phone.price*count(phone.phoneId) as total from company 
inner join phone on phone.companyId=company.companyId where phone.price > 0 group by phone.phoneModel;
select distinct max(avg(price)) over () max_avg_price from phone group by companyId;
select company.companyCountry, count(phone.phoneId) as total from company 
inner join phone on phone.companyId=company.companyId where company.companyCountry = "China" and phone.price > 0 group by company.companyCountry;
select company.companyName, max(phone.price) from company 
inner join phone on phone.companyId=company.companyId where phone.price > 0 group by phone.companyId;