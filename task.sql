-- Use our database
USE ShopDB;

-- Start the transaction
START TRANSACTION;

-- Create a new order
INSERT INTO Orders (CustomerID, Date) VALUES (1, '2023-01-01');

-- Add order item using LAST_INSERT_ID() to get the order ID
INSERT INTO OrderItems (OrderID, ProductID, Count) VALUES (LAST_INSERT_ID(), 1, 1);

-- Update warehouse amount
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;

COMMIT; 