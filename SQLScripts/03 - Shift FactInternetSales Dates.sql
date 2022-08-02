--This query shifts all the FactInternetSales dates 8 years forward so the current year is 2022 not 2014
UPDATE [dbo].[FactInternetSales]
SET 
	OrderDateKey = OrderDateKey + 80000,
	DueDateKey = DueDateKey + 80000,
	ShipDateKey = ShipDateKey + 80000