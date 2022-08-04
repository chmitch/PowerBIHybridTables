--These queries make sure there are no orders related to leap years to ensure you can shift the records by quantities not divisible by 4.
UPDATE [dbo].[FactInternetSales]
SET
	OrderDateKey = 20120228,
	OrderDate = CAST('2/28/2012' as datetime)
WHERE OrderDateKey = 20120229

UPDATE [dbo].[FactInternetSales]
SET
	DueDateKey = 20120228,
	DueDate = CAST('2/28/2012' as datetime)
WHERE DueDateKey = 20120229

UPDATE [dbo].[FactInternetSales]
SET
	ShipDateKey = 20120228,
	ShipDate = CAST('2/28/2012' as datetime)
WHERE ShipDateKey = 20120229

--This query shifts all the FactInternetSales dates 9 years forward, this will ensure there is data in the database through January 2023.
--If you happen to be using the example beyond January 2023 you might need to shift an additional year into the future.
UPDATE [dbo].[FactInternetSales]
SET 
	OrderDateKey = OrderDateKey + 90000,
	OrderDate = DATEADD(yy,9,OrderDate),
	DueDateKey = DueDateKey + 90000,
	DueDate = DATEADD(yy,9,DueDate),
	ShipDateKey = ShipDateKey + 90000,
	ShipDate = DATEADD(yy,9,ShipDate)