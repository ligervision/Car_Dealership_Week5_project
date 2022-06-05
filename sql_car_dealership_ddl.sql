-- CAR LAND DEALERSHIP DATABASE


-- CREATE TABLES

-- Create tables for people (customer, salesperson, mechanic)

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	last_name VARCHAR(35),
	first_name VARCHAR(35),
	address VARCHAR(35),
	city  VARCHAR(35),
	state VARCHAR(2),
	country VARCHAR(35),
	zip_code VARCHAR(10),
	phone_number VARCHAR(12),
	email_address VARCHAR(255)
);

SELECT *
FROM customer;


CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	last_name VARCHAR(35),
	first_name VARCHAR(35),
	commission_rate DECIMAL(6,2)
);

SELECT *
FROM salesperson;


CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	last_name VARCHAR(35),
	first_name VARCHAR(35)
);

SELECT *
FROM mechanic;


-- Create tables for assets (car, part, service)

CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	vin_number VARCHAR(17),
	car_year INTEGER,
	car_make VARCHAR(35),
	car_model VARCHAR(35),
	car_color VARCHAR(35),
	car_price DECIMAL(10,2),
	for_sale BOOLEAN 
);

SELECT *
FROM car;


CREATE TABLE part(
	part_id SERIAL PRIMARY KEY,
	description VARCHAR(35),
	inventory_amount INTEGER,
	purchase_price DECIMAL(10,2),
	retail_price DECIMAL(10,2)
);

SELECT *
FROM part;


CREATE TABLE service(
	service_id SERIAL PRIMARY KEY,
	service_name VARCHAR(35),
	service_cost DECIMAL(10,2)
);

SELECT *
FROM service;


-- Create tables for operations

CREATE TABLE sales_invoice(
	invoice_id SERIAL PRIMARY KEY,
	invoice_date VARCHAR(10),
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	sales_invoice_total DECIMAL(10,2)
);

SELECT *
FROM sales_invoice;


CREATE TABLE service_ticket(
	service_ticket_id SERIAL PRIMARY KEY,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	date_received VARCHAR(10),
	service_comments VARCHAR(255),
	date_returned VARCHAR(10),
	service_invoice_total DECIMAL(10,2)
);

SELECT *
FROM service_ticket;


CREATE TABLE service_mechanic( -- This describes a single job, joining service ticket to mechanic & service 
	serv_mech_id SERIAL PRIMARY KEY,
	service_ticket_id INTEGER NOT NULL,
	FOREIGN KEY(service_ticket_id) REFERENCES service_ticket(service_ticket_id),
	service_id INTEGER NOT NULL,
	FOREIGN KEY(service_id) REFERENCES service(service_id),
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	hours_worked DECIMAL(6,2),
	hourly_rate DECIMAL(6,2),
	serv_mech_comments VARCHAR(255),
	total_labor_cost DECIMAL(10,2)
);

SELECT *
FROM service_mechanic;


CREATE TABLE parts_used( -- This describes a single part order, joining service ticket to parts
	parts_used_id SERIAL PRIMARY KEY,
	service_ticket_id INTEGER NOT NULL,
	FOREIGN KEY(service_ticket_id) REFERENCES service_ticket(service_ticket_id),
	part_id INTEGER NOT NULL,
	FOREIGN KEY(part_id) REFERENCES part(part_id),
	number_used INTEGER,
	total_parts_cost DECIMAL(10,2)
);

SELECT *
FROM parts_used;




-- ADD DATA TO TABLES

SELECT *
FROM customer;

INSERT INTO customer(
	last_name,
	first_name,
	address,
	city,
	state,
	country,
	zip_code,
	phone_number,
	email_address 
) VALUES (
	'Fantastic',
	'Alexander',
	'555 Circle Drive',
	'Nashville',
	'TN',
	'United States',
	'37218',
	'555-555-5555',
	'alex.fantastic@gmail.com'
);

INSERT INTO customer(
	last_name,
	first_name,
	address,
	city,
	state,
	country,
	zip_code,
	phone_number,
	email_address 
) VALUES (
	'Magnanimous',
	'Charles',
	'444 Square Street',
	'Murfreesboro',
	'TN',
	'United States',
	'37127',
	'615-876-4444',
	'charles.magnanimous@gmail.com'
);

SELECT *
FROM customer;


INSERT INTO salesperson(
	last_name,
	first_name,
	commission_rate 
) VALUES (
	'Cheatham',
	'Willy',
	'25'
);

INSERT INTO salesperson(
	last_name,
	first_name,
	commission_rate 
) VALUES (
	'Proffitt',
	'Donna',
	'25'
);

SELECT *
FROM salesperson;


INSERT INTO mechanic(
	last_name,
	first_name
) VALUES (
	'Pitts',
	'Dusty'
);

INSERT INTO mechanic(
	last_name,
	first_name
) VALUES (
	'Handy',
	'Otto'
);

SELECT *
FROM mechanic;


INSERT INTO car(
	vin_number,
	car_year,
	car_make,
	car_model,
	car_color,
	car_price,
	for_sale
) VALUES (
	'JH4KA7560NC004288',
	'1969',
	'Chevrolet',
	'Impala SS L72 427',
	'turtle green',
	36400,
	TRUE
);

INSERT INTO car(
	vin_number,
	car_year,
	car_make,
	car_model,
	car_color,
	car_price,
	for_sale
) VALUES (
	'JH4KA7552RC007366',
	'1964',
	'Chevrolet',
	'Impala SS 409',
	'black',
	37500,
	TRUE
);

INSERT INTO car(
	vin_number,
	car_year,
	car_make,
	car_model,
	car_color,
	car_price,
	for_sale
) VALUES (
	'5GZCZ63B93S896664',
	'1973',
	'Chevrolet',
	'Impala ACRS',
	'avocado',
	8750,
	TRUE
);

INSERT INTO car(
	vin_number,
	car_year,
	car_make,
	car_model,
	car_color,
	car_price,
	for_sale
) VALUES (
	'1FVHG3DX3DHFE3747',
	'1959',
	'Chevrolet',
	'Impala Convertible',
	'white',
	61100,
	TRUE
);

INSERT INTO car(
	vin_number,
	car_year,
	car_make,
	car_model,
	car_color,
	car_price,
	for_sale
) VALUES (
	'WBAFR9C59BC270614',
	'1958',
	'Chevrolet',
	'Impala Rochester',
	'black',
	54500,
	TRUE
);

SELECT *
FROM car;


INSERT INTO part(
	description,
	inventory_amount,
	purchase_price,
	retail_price
) VALUES (
	'oil filter',
	20,
	5,
	10
);

INSERT INTO part(
	description,
	inventory_amount,
	purchase_price,
	retail_price
) VALUES (
	'air filter',
	30,
	10,
	20
);

INSERT INTO part(
	description,
	inventory_amount,
	purchase_price,
	retail_price
) VALUES (
	'drive belt',
	27,
	25,
	50
);

INSERT INTO part(
	description,
	inventory_amount,
	purchase_price,
	retail_price
) VALUES (
	'synthetic oil - 5 qt',
	50,
	17,
	25
);

INSERT INTO part(
	description,
	inventory_amount,
	purchase_price,
	retail_price
) VALUES (
	'wiper blades',
	27,
	25,
	50
);

INSERT INTO part(
	description,
	inventory_amount,
	purchase_price,
	retail_price
) VALUES (
	'anti-freeze - 1 gal',
	35,
	10,
	20
);

INSERT INTO part(
	description,
	inventory_amount,
	purchase_price,
	retail_price
) VALUES (
	'car battery',
	40,
	25,
	50
);

SELECT *
FROM part;



INSERT INTO service(
	service_name,
	service_cost
) VALUES (
	'oil/oil filter change',
	30
);

INSERT INTO service(
	service_name,
	service_cost
) VALUES (
	'wiper blade replacement',
	10
);

INSERT INTO service(
	service_name,
	service_cost
) VALUES (
	'brake work, per axle',
	100
);

INSERT INTO service(
	service_name,
	service_cost
) VALUES (
	'antifreeze change',
	100
);

INSERT INTO service(
	service_name,
	service_cost
) VALUES (
	'air filter replacement',
	30
);

INSERT INTO service(
	service_name,
	service_cost
) VALUES (
	'battery replacement',
	40
);

INSERT INTO service(
	service_name,
	service_cost
) VALUES (
	'engine tune-up',
	90
);

INSERT INTO service(
	service_name,
	service_cost
) VALUES (
	'tire rotation',
	40
);

INSERT INTO service(
	service_name,
	service_cost
) VALUES (
	'wheels aligned/balanced - front-end',
	50
);

INSERT INTO service(
	service_name,
	service_cost
) VALUES (
	'wheels aligned/balanced - all 4',
	100
);

INSERT INTO service(
	service_name,
	service_cost
) VALUES (
	'routine scheduled maintenance',
	100
);

SELECT *
FROM service;



-- Create SALES INVOICES

INSERT INTO sales_invoice(
	invoice_date,
	car_id, --FK
	customer_id, --FK
	salesperson_id, --FK
	sales_invoice_total
) VALUES (
	'2022-06-05',
	1,
	1,
	1,
	36400
);

INSERT INTO sales_invoice(
	invoice_date,
	car_id, --FK
	customer_id, --FK
	salesperson_id, --FK
	sales_invoice_total
) VALUES (
	'2022-06-04',
	7,
	2,
	2,
	54500
);

SELECT *
FROM sales_invoice;


-- Create SERVICE TICKETS

INSERT INTO service_ticket(
	car_id, --FK
	customer_id, --FK
	date_received,
	service_comments,
	date_returned,
	service_invoice_total
) VALUES (
	3,
	1,
	'2022-06-06',
	'drive belt is fine',
	'2022-06-07',
	990
);

INSERT INTO service_ticket(
	car_id, --FK
	customer_id, --FK
	date_received,
	service_comments,
	date_returned,
	service_invoice_total
) VALUES (
	4,
	2,
	'2022-06-07',
	'awaiting new tires',
	'2022-06-08',
	500
);

SELECT *
FROM service_ticket;


-- Create SERVICE_MECHANIC jobs

INSERT INTO service_mechanic(
	service_ticket_id, --FK
	service_id, --FK
	mechanic_id, --FK
	hours_worked,
	hourly_rate,
	serv_mech_comments,
	total_labor_cost
) VALUES (
	1,
	1,
	1,
	2,
	20,
	'none',
	500
);

INSERT INTO service_mechanic(
	service_ticket_id, --FK
	service_id, --FK
	mechanic_id, --FK
	hours_worked,
	hourly_rate,
	serv_mech_comments,
	total_labor_cost
) VALUES (
	1,
	2,
	2,
	1.5,
	20,
	'none',
	400
);

SELECT *
FROM service_mechanic;


-- Create PARTS_USED instances

INSERT INTO parts_used(
	service_ticket_id, --FK
	part_id, --FK
	number_used,
	total_parts_cost
) VALUES (
	1,
	1,
	1,
	10
);

INSERT INTO parts_used(
	service_ticket_id, --FK
	part_id, --FK
	number_used,
	total_parts_cost
) VALUES (
	4,
	3,
	1,
	20
);

SELECT *
FROM parts_used;






