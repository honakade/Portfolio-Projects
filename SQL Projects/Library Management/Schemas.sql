CREATE Database Library_management;

USE Library_management;

CREATE TABLE branch
(
branch_id VARCHAR(20) PRIMARY KEY,
manager_id	VARCHAR(20),
branch_address	VARCHAR(255),
contact_no VARCHAR(255)
);

CREATE TABLE employees
(
    emp_id	VARCHAR(255) PRIMARY KEY,
	emp_name VARCHAR(255),
	position VARCHAR(255),
	salary INT,
	branch_id VARCHAR(255)
);

CREATE TABLE books
(
	isbn VARCHAR(255) PRIMARY KEY,
    book_title	VARCHAR(255),
    category	VARCHAR(255),
    rental_price DECIMAL (10,2),
    status	VARCHAR(255),
    author	VARCHAR(255),
    publisher VARCHAR(255)
    );
    
CREATE TABLE members
(
	member_id	VARCHAR(255) PRIMARY KEY,
    member_name	VARCHAR(255),
    member_address	VARCHAR(255),
    reg_date DATE
);

CREATE TABLE issued_status
(	
	issued_id VARCHAR(255) PRIMARY KEY,
    issued_member_id VARCHAR(255),
    issued_book_name	VARCHAR(255),
    issued_date	DATE,
    issued_book_isbn	VARCHAR(255),
    issued_emp_id VARCHAR(255)
);

CREATE TABLE return_status
(
	return_id	VARCHAR(255) PRIMARY KEY,
    issued_id	VARCHAR(255),
    return_book_name	VARCHAR(255),
    return_date	DATE,
    return_book_isbn VARCHAR(255)
    );
    
    
-- Adding FOREIGN KEY TO TABLES

ALTER TABLE issued_status
ADD CONSTRAINT fk_issued_member
FOREIGN KEY (issued_member_id) REFERENCES members(member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_issued_book
FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn);

ALTER TABLE employees
ADD CONSTRAINT fk_employee_branch
FOREIGN KEY (branch_id) REFERENCES branch(branch_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn);


ALTER TABLE return_status
ADD CONSTRAINT fk_return_issued
FOREIGN KEY (issued_id) REFERENCES issued_status(issued_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_return_book
FOREIGN KEY (return_book_isbn) REFERENCES books(isbn);


