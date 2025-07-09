-- Library Management System Project 

-- Creating Database
 
CREATE DATABASE library;

-- Use database

USE library;

-- Creating Table branch


DROP TABLE IF EXISTS branch;
CREATE TABLE branch
(
    banch_id VARCHAR(10) PRIMARY KEY,
    manager_id VARCHAR(10),
    brnch_address VARCHAR(55),
    contact_no VARCHAR(10)
);

SELECT * FROM branch;

-- Creating Table employee

DROP TABLE IF EXISTS employee;
CREATE TABLE employee
(				
    emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(55),
    position VARCHAR(55),
    salary int,
    branch_id VARCHAR(10)    -- FK
);

-- Creating Table books

ALTER TABLE books
MODIFY category VARCHAR(20);

DROP TABLE IF EXISTS books;
CREATE TABLE books
(							
			
    isbn VARCHAR(20) PRIMARY KEY,
    book_title VARCHAR(75),
    category VARCHAR(10),
    rental_price FLOAT,
    status VARCHAR(15),
    author varchar(35),
    publisher VARCHAR(55)
);
SELECT * FROM books;

-- Creating Table members

DROP TABLE IF EXISTS members;
CREATE TABLE members
(						
	member_id VARCHAR(10) PRIMARY KEY,
    member_name VARCHAR(25),
    member_address VARCHAR(75),
    reg_date DATE
);
SELECT * FROM members;

-- Creating Table issued_status

DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
(					
	issued_id VARCHAR(10) PRIMARY KEY,
    issued_member_id VARCHAR(10),   -- FK
    issued_book_name VARCHAR(75),
    issued_date DATE,               
    issued_book_isbn VARCHAR(25),   -- FK
    issued_emp_id VARCHAR(10)       -- FK
);
SELECT * FROM issued_status;


-- Creating Table return_status

DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
(					
	return_id VARCHAR(10) PRIMARY KEY,
    issued_id VARCHAR(10),         -- FK
    return_book_name VARCHAR(75),
    return_date DATE,
    return_book_isbn VARCHAR(25)
);
SELECT * FROM return_status;

-- FOREIGN KEY

ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employee
FOREIGN KEY (issued_emp_id)
REFERENCES employee(emp_id);

ALTER TABLE employee
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch(banch_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);


