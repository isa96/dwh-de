CREATE PROCEDURE summary_order_status
    @StatusID INT
AS
BEGIN
    SELECT fs.OrderID, dc.CustomerName, dp.ProductName, fs.Quantity, dso.StatusOrder
    FROM FactSalesOrder fs
    JOIN DimCustomer dc ON fs.CustomerID = dc.CustomerID
    JOIN DimProduct dp ON fs.ProductID = dp.ProductID
    JOIN DimStatusOrder dso ON fs.StatusID = dso.StatusID
    WHERE dso.StatusID = @StatusID;
END