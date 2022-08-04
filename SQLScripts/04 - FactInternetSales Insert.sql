--Run this as many times as you want.  
--It will insert a new row into Fact Internet Sales each time and can be used to illustrate the current day is getting pulled from direct query.
DECLARE @dateValue date = GetDate()
DECLARE @dateKey int = (YEAR(GetDate()) * 10000) + (MONTH(GetDate()) * 100) + DAY(GetDate())

INSERT INTO FactInternetSales
(
    [ProductKey],
	[OrderDateKey],
	[DueDateKey],
	[ShipDateKey],
	[CustomerKey],
	[PromotionKey],
	[CurrencyKey],
	[SalesTerritoryKey],
	[SalesOrderNumber],
	[SalesOrderLineNumber],
	[RevisionNumber],
	[OrderQuantity],
	[UnitPrice],
	[ExtendedAmount],
	[UnitPriceDiscountPct],
	[DiscountAmount],
	[ProductStandardCost],
	[TotalProductCost],
	[SalesAmount],
	[TaxAmt],
	[Freight],
	[OrderDate],
	[DueDate],
	[ShipDate]
)
VALUES
(
    310,
    @dateKey,
    @dateKey,
    @dateKey,
    21768,
    1,
    19,
    6,
    'SO' + LEFT(CAST(NEWID() as varchar(40)),18),
    1,
    1,
    1,
    3578.2700,
    3578.2700,
    0,
    0,
    2171.2942,
    2171.2942,
    3578.2700,
    286.2616,
    89.4568,
    @dateValue,
    @dateValue,
    @dateValue
)