create database market_star_schema;
use market_star_schema;

create table shipping_mode_dimen (
	Ship_Mode varchar(25),
    Vehicle_Company varchar(25),
    Toll_Required boolean
);
alter table shipping_mode_dimen
add constraint primary key (Ship_Mode);

alter table shipping_mode_dimen
add Vehicle_Number varchar(25);

alter table shipping_mode_dimen
change Toll_Required Toll_Amount INT;

INSERT INTO shipping_mode_dimen
VALUES
	('DELIVERY TRUCK','Ashok Layland',false),
    ('REGULAR AIR','Air India', false);
    
INSERT INTO shipping_mode_dimen (Ship_Mode, Vehicle_Company, Toll_Required)
VALUES
	('DELIVERY TRUCK','Ashok Layland',false),
    ('REGULAR AIR','Air India', false);
    
UPDATE shipping_mode_dimen
SET Toll_Required = true
WHERE Ship_Mode = 'DELIVERY TRUCK';

SET SQL_SAFE_UPDATES = 0;
DELETE FROM shipping_mode_dimen
WHERE Vehicle_Company = 'Air India';

SELECT * FROM shipping_mode_dimen;