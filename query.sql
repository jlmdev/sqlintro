--
DROP DATABASE [IF EXISTS] CompanyDatabase;

CREATE DATABASE CompanyDatabase;

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