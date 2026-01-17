-- Use our database
USE ShopDB;

-- Some data should be created outside the transaction (here)
-- Create a new order (can be outside transaction as it's independent)
INSERT INTO Orders (CustomerID, Date) VALUES (1, '2023-01-01');

-- Start the transaction
START TRANSACTION;

-- And some data should be created inside the transaction
-- Add order item and update warehouse amount atomically
INSERT INTO OrderItems (OrderID, ProductID, Count) VALUES (1, 1, 1);
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;

COMMIT; 