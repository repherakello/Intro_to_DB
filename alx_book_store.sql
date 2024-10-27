-- Create the database
CREATE DATABASE alx_book_store;

-- Use the database
USE alx_book_store;

-- Create the Authors table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(215) NOT NULL
);

-- Create the Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create the Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT NOT NULL
);

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create the Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Optional: Insert some test data
INSERT INTO Authors (author_name) VALUES 
('George Orwell'),
('J.K. Rowling'),
('Harper Lee');

INSERT INTO Books (title, author_id, price, publication_date) VALUES 
('1984', 1, 15.99, '1949-06-08'),
('Harry Potter and the Philosopher\'s Stone', 2, 22.99, '1997-06-26'),
('To Kill a Mockingbird', 3, 18.99, '1960-07-11');

INSERT INTO Customers (customer_name, email, address) VALUES 
('John Doe', 'john@example.com', '123 Main St, Cityville'),
('Jane Smith', 'jane@example.com', '456 Oak St, Townsville');

INSERT INTO Orders (customer_id, order_date) VALUES 
(1, '2024-10-27'),
(2, '2024-10-26');

INSERT INTO Order_Details (order_id, book_id, quantity) VALUES 
(1, 1, 2),
(1, 3, 1),
(2, 2, 1);
