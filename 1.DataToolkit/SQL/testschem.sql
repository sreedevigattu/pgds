CREATE SCHEMA test;

CREATE TABLE test.Retailinfo (
	ID varchar(255), 
	ProductName varchar(255), 
	Branch varchar(255),
	Availability varchar(255),
	Stock int
);

INSERT INTO test.Retailinfo (ID, ProductName, Branch, Availability, Stock)
VALUES 
("1","Prod1","Delhi","Available",5),
("2","Prod2","Delhi","Available",9),
("3","Prod3","Delhi","NA",0),
("4","Prod4","Delhi","NA",0),
("5","Prod5","Delhi","NA",0),
("6","Prod6","Mumbai","Available",4),
("7","Prod7","Mumbai","Available",1),
("8","Prod8","Mumbai","NA",0),
("9","Prod9","Bangalore","Available",10),
("10","Prod10","Bangalore","Available",8),
("11","Prod11","Bangalore","Available",7),
("12","Prod12","Bangalore","NA",0),
("13","Prod13","Chennai","Available",2),
("14","Prod14","Chennai","NA",0),
("15","Prod15","Chennai","NA",0),
("16","Prod16","Hyderabad","NA",0),
("17","Prod17","Hyderabad","Available",6),
("18","Prod18","Hyderabad","Available",9),
("19","Prod19","Hyderabad","NA",0),
("20","Prod20","Bangalore","NA",0)
