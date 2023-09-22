--Create campaign table
DROP TABLE if exists campaign;
CREATE TABLE campaign (
	cf_id INT PRIMARY KEY,
	contact_id INT NOT NULL,
	company_name VARCHAR(100) NOT NULL,
	description TEXT NOT NULL,
	goal NUMERIC(10,2) NOT NULL,
	pledged NUMERIC(10,2) NOT NULL,
	outcome VARCHAR(100) NOT NULL,
	backers_count INT NOT NULL,
	country VARCHAR(20) NOT NULL,
	currency VARCHAR(20) NOT NULL,
	launch_date DATE NOT NULL,
	end_date DATE NOT NULL,
	category_id VARCHAR(10) NOT NULL,
	subcategory_id VARCHAR(10) NOT NULL
);

--Create category table
DROP TABLE if exists category;
CREATE TABLE category (
	category_id VARCHAR(10) PRIMARY KEY,
	category_name VARCHAR(50) NOT NULL
);

--Create subcategory table
DROP TABLE if exists subcategory;
CREATE TABLE subcategory (
	subcategory_id VARCHAR(10) PRIMARY KEY,
	subcategory_name VARCHAR(50) NOT NULL
);

--Create contacts table
DROP TABLE if exists contacts;
CREATE TABLE contacts (
	contact_id INT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR NOT NULL
);

ALTER TABLE campaign 
	ADD CONSTRAINT fk_campaign_contact_id 
	FOREIGN KEY (contact_id) 
	REFERENCES contacts(contact_id);
	
ALTER TABLE campaign
	ADD CONSTRAINT fk_campaign_category_id
	FOREIGN KEY (category_id) 
	REFERENCES category(category_id);
	
ALTER TABLE campaign 
	ADD CONSTRAINT fk_campaign_subcategory_id
	FOREIGN KEY (subcategory_id) 
	REFERENCES subcategory(subcategory_id);

SELECT * FROM campaign;
SELECT * FROM category;
SELECT * FROM subcategory;
SELECT * FROM contacts;