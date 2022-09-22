/*
Given the way we're populating the factInternetSales table, its highly likely there will be orders for future dates.
For hybrid tables, the direct query partition actually looks for all rows greater than the date of the last in memory partition 
thereby causing some confusing results.

This script is designed to cleanup all orders with an OrderDate greater than today.
The only reason this script exists is to make it easier to see the results of Hybrid tables.
*/
DECLARE @dateValue date = GetDate()

DELETE 
FROM [dbo].[FactInternetSalesReason]
WHERE SalesOrderNumber IN 
(
	SELECT SalesOrderNumber
	FROM [dbo].[FactInternetSales]
	WHERE OrderDate >= @dateValue
)

DELETE
FROM [dbo].[FactInternetSales]
WHERE OrderDate >= @dateValue