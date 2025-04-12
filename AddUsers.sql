-- Create Users
CREATE USER 'junior'@'localhost' IDENTIFIED BY 'Pass111';
CREATE USER 'lulu'@'localhost' IDENTIFIED BY 'Pass112';
CREATE USER 'mpho'@'localhost' IDENTIFIED BY 'Pass113';

--  Create Roles
CREATE ROLE BookStore_manager;
CREATE ROLE Sales_assistant;
CREATE ROLE Store_cashier;

-- Grant Privileges to Roles

-- Store Manager Role (Grant all access to the bookstore database)
GRANT ALL PRIVILEGES ON bookstore.* TO BookStore_manager;

-- Sales Assistant Role (Read-Only Access)
GRANT SELECT ON bookstore.book TO Sales_assistant;
GRANT SELECT ON bookstore.cust_order TO Sales_assistant;
GRANT SELECT ON bookstore.order_line TO Sales_assistant;
GRANT SELECT ON bookstore.customer TO Sales_assistant;

-- Bookstore Cashier Role (Update Orders and Status)
GRANT SELECT, UPDATE ON bookstore.cust_order TO Store_cashier;
GRANT SELECT, UPDATE ON bookstore.order_line TO Store_cashier;
GRANT SELECT ON bookstore.customer TO Store_cashier;
GRANT SELECT, UPDATE ON bookstore.order_status TO Store_cashier;

-- Assign Roles to Users

-- Assign the 'BookStore_manager' role to Junior (Full access)
GRANT BookStore_manager TO 'junior'@'localhost';

-- Assign the 'Sales_assistant' role to Lulu (Read-Only Access)
GRANT Sales_assistant TO 'lulu'@'localhost';

-- Assign the 'Store_cashier' role to Mpho (Cashier role with update access)
GRANT Store_cashier TO 'mpho'@'localhost';