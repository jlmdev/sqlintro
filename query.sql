--
-- DROP DATABASE [IF EXISTS] CompanyDatabase;

-- CREATE DATABASE CompanyDatabase;

CREATE TABLE "Employees" (
  "FullName"          TEXT,
  "Salary"            INT,
  "JobPosition"       TEXT,
  "PhoneExtension"    TEXT,
  "IsPartTime"        BOOLEAN
);


-- Insert Dummy Rows
-- Dummy 1
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Lazy Larry', 1000, 'Clock Watcher', '1234', true);

-- Dummy 2
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Jenny Jenny',2000,'HR Rep','5309', false);

-- Dummy 3
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Brenden Ramos',485,'Cook','0166',true);

-- Dummy 4
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Paula Bevan',492,'Cook','0170',true);

-- Dummy 5
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Latisha Kerr',2992,'Occupational Therapist','0169',false);

-- Dummy 6
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Fynley Grey',2568,'Mechanical Engineer','0161',false);

-- Dummy 7
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Lexi-Mai Winters',1704,'Mathematician','0187',true);

-- Dummy 8
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Mahnoor Noel',2588,'Writer','20156',false);

-- Dummy 9
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Valerie Yates',1049,'Logistician','0162',false);

-- Dummy 10
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Mohamad Wharton',793,'Psychologist','0197',true);

-- Select all columns for all employees
SELECT * FROM "Employees";

--  Select only full name and phone extension for only part time employees
SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = true;

-- Insert a new part-time employee as a software developer with a salary of 450. Create arbitrary values for other columns.
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Earl McIntosh',450,'Software Developer','0667',true);

-- Add Column ParkingSpot as VARCHAR(10)
ALTER TABLE "Employees" ADD COLUMN "ParkingSpot" VARCHAR(10);

-- Create Departments table
CREATE TABLE "Departments" (
  "Name"                TEXT NOT NULL,
  "BuildingNumber"      INT
);

ALTER TABLE "Departments" 
  ADD COLUMN "Id" SERIAL PRIMARY KEY;

-- Add Column DepartmentId to Employees table and make it a foreign key for Departments on Id
ALTER TABLE "Employees" ADD COLUMN "DepartmentId" INT REFERENCES "Departments" ("Id");

-- Create Products Table
CREATE TABLE "Products" (
  "Id"                SERIAL PRIMARY KEY,
  "Price"             DOUBLE PRECISION,
  "Name"              TEXT,
  "Description"       TEXT,
  "QuantityInStock"   INT
);


-- Create Orders Table
CREATE TABLE "Orders" (
  "Id"                SERIAL PRIMARY KEY,
  "OrderNumber"       TEXT,
  "DatePlaced"        TIMESTAMP,
  "Email"             TEXT
);

-- Change the column name in departments table from Name TO DepartmentName
ALTER TABLE "Departments" RENAME "Name" TO "DepartmentName";

ALTER TABLE "Departments" RENAME "BuildingNumber" TO "Building";

ALTER TABLE "Departments" ALTER COLUMN "Building" TYPE TEXT; 

-- Create ProductOrders Table
CREATE TABLE "ProductOrders" (
  "Id"                SERIAL PRIMARY KEY,
  "Product"           INT REFERENCES "Products" ("Id"),
  "Order"             INT REFERENCES "Orders" ("Id"),
  "OrderQuantity"     INT
);

-- Insert data into Departments table
INSERT INTO "Departments" ("DepartmentName", "Building")
VALUES ('Development','Main');


INSERT INTO "Departments" ("DepartmentName", "Building")
VALUES ('Marketing','North');

-- Insert Employees
INSERT INTO "Employees" ("FullName","Salary","JobPosition","PhoneExtension","IsPartTime","DepartmentId")
VALUES ('Tim Smith', 40000, 'Programmer', '123', false, 1);

INSERT INTO "Employees" ("FullName","Salary","JobPosition","PhoneExtension","IsPartTime","DepartmentId")
VALUES ('Barbara Ramsey', 80000, 'Manager', '234', false, 1);

INSERT INTO "Employees" ("FullName","Salary","JobPosition","PhoneExtension","IsPartTime","DepartmentId")
VALUES ('Tom Jones', 32000, 'Admin', '456', true, 2);

-- Insert Products
INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock")
VALUES ( 12.45, 'Widget', 'The Original Widget', 100);

INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock")
VALUES ( 99.99, 'Flowbee', 'Perfect For Haircuts', 3);

-- Insert order X529
INSERT INTO "Orders" ("OrderNumber", "DatePlaced", "Email")
VALUES ('X529', '2020-01-01 16:55:00', 'person@example.com');

SELECT * FROM "Orders";

SELECT * FROM "Products";

-- Add 3 Widgets to X529
INSERT INTO "ProductOrders" ("Product", "Order", "OrderQuantity")
VALUES ( 1, 1, 3);

-- Add 2 Flowbees to X529
INSERT INTO "ProductOrders" ("Product", "Order", "OrderQuantity")
VALUES ( 2, 1, 2);

-- Given a department id, return all employees in the department
SELECT "FullName" FROM "Employees" WHERE "DepartmentId" = 1;

-- Given a department name, return all the phone extensions
SELECT "PhoneExtension" FROM "Employees"
JOIN "Departments" ON "Departments"."Id" = "Employees"."DepartmentId"
WHERE "Departments"."DepartmentName" = 'Development';

-- Find all orders that contain the product id of 2
SELECT "OrderNumber"
FROM "Orders" 
JOIN "ProductOrders" ON "ProductOrders"."Order" = "Orders"."Id"
JOIN "Products" ON "Products"."Id" = "ProductOrders"."Product"

DELETE FROM "ProductOrders"
WHERE "Id" = (
  SELECT "ProductOrders"."Id"
  FROM "ProductOrders"
  JOIN "Products" ON "Products"."Id" = "ProductOrders"."Product"
  JOIN "Orders" ON "Orders"."Id" = "ProductOrders"."Order"
  WHERE "Products"."Name" = 'Flowbee' AND "Orders"."OrderNumber" = 'X529'
)