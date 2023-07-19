USE [master]
GO
/****** Object:  Database [ContosoSpanish]    Script Date: 3/25/2020 5:31:56 PM ******/
CREATE DATABASE [ContosoSpanish]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ContosoRetailDW2.1', FILENAME = N'X:\DATABASES_SQLSERVER\ContosoSpanish.mdf' , SIZE = 1075968KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ContosoRetailDW2.1_log', FILENAME = N'X:\DATABASES_SQLSERVER\ContosoSpanish_1.ldf' , SIZE = 3840KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 COLLATE Modern_Spanish_CI_AS
GO
ALTER DATABASE [ContosoSpanish] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ContosoSpanish].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ContosoSpanish] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ContosoSpanish] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ContosoSpanish] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ContosoSpanish] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ContosoSpanish] SET ARITHABORT OFF 
GO
ALTER DATABASE [ContosoSpanish] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ContosoSpanish] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ContosoSpanish] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ContosoSpanish] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ContosoSpanish] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ContosoSpanish] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ContosoSpanish] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ContosoSpanish] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ContosoSpanish] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ContosoSpanish] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ContosoSpanish] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ContosoSpanish] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ContosoSpanish] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ContosoSpanish] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ContosoSpanish] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ContosoSpanish] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ContosoSpanish] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ContosoSpanish] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ContosoSpanish] SET  MULTI_USER 
GO
ALTER DATABASE [ContosoSpanish] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ContosoSpanish] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ContosoSpanish] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ContosoSpanish] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ContosoSpanish] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ContosoSpanish', N'ON'
GO
ALTER DATABASE [ContosoSpanish] SET QUERY_STORE = OFF
GO
USE [ContosoSpanish]
GO
/****** Object:  Table [dbo].[FactOnlineSales]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactOnlineSales](
	[OnlineSalesKey] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [datetime] NOT NULL,
	[StoreKey] [int] NOT NULL,
	[ProductKey] [int] NOT NULL,
	[PromotionKey] [int] NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[SalesOrderLineNumber] [int] NULL,
	[SalesQuantity] [int] NOT NULL,
	[SalesAmount] [money] NOT NULL,
	[ReturnQuantity] [int] NOT NULL,
	[ReturnAmount] [money] NULL,
	[DiscountQuantity] [int] NULL,
	[DiscountAmount] [money] NULL,
	[TotalCost] [money] NOT NULL,
	[UnitCost] [money] NULL,
	[UnitPrice] [money] NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[SalesOrderNumber] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_FactOnlineSales_SalesKey] PRIMARY KEY CLUSTERED 
(
	[OnlineSalesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[Datekey] [datetime] NOT NULL,
	[FullDateLabel] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[DateDescription] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CalendarYear] [int] NOT NULL,
	[CalendarYearLabel] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CalendarHalfYear] [int] NOT NULL,
	[CalendarHalfYearLabel] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CalendarQuarter] [int] NOT NULL,
	[CalendarQuarterLabel] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[CalendarMonth] [int] NOT NULL,
	[CalendarMonthLabel] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CalendarWeek] [int] NOT NULL,
	[CalendarWeekLabel] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CalendarDayOfWeek] [int] NOT NULL,
	[CalendarDayOfWeekLabel] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[FiscalYearLabel] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FiscalHalfYear] [int] NOT NULL,
	[FiscalHalfYearLabel] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FiscalQuarter] [int] NOT NULL,
	[FiscalQuarterLabel] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FiscalMonth] [int] NOT NULL,
	[FiscalMonthLabel] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[IsWorkDay] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[IsHoliday] [int] NOT NULL,
	[HolidayName] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[EuropeSeason] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[NorthAmericaSeason] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[AsiaSeason] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_DimDate_DateKey] PRIMARY KEY CLUSTERED 
(
	[Datekey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProduct]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduct](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductLabel] [nvarchar](255) COLLATE Modern_Spanish_CI_AS NULL,
	[ProductName] [nvarchar](500) COLLATE Modern_Spanish_CI_AS NULL,
	[ProductDescription] [nvarchar](400) COLLATE Modern_Spanish_CI_AS NULL,
	[ProductSubcategoryKey] [int] NULL,
	[Manufacturer] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[BrandName] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[ClassID] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[ClassName] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[StyleID] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[StyleName] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ColorID] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[ColorName] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Size] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[SizeRange] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[SizeUnitMeasureID] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Weight] [float] NULL,
	[WeightUnitMeasureID] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[UnitOfMeasureID] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[UnitOfMeasureName] [nvarchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[StockTypeID] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[StockTypeName] [nvarchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[UnitCost] [money] NULL,
	[UnitPrice] [money] NULL,
	[AvailableForSaleDate] [datetime] NULL,
	[StopSaleDate] [datetime] NULL,
	[Status] [nvarchar](7) COLLATE Modern_Spanish_CI_AS NULL,
	[ImageURL] [nvarchar](150) COLLATE Modern_Spanish_CI_AS NULL,
	[ProductURL] [nvarchar](150) COLLATE Modern_Spanish_CI_AS NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimProduct_ProductKey] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProductCategory]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProductCategory](
	[ProductCategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryLabel] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[ProductCategoryName] [nvarchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ProductCategoryDescription] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimProductCategory_ProductCategoryKey] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_DimProductCategory_ProductCategoryLabel] UNIQUE NONCLUSTERED 
(
	[ProductCategoryLabel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProductSubcategory]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProductSubcategory](
	[ProductSubcategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubcategoryLabel] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[ProductSubcategoryName] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ProductSubcategoryDescription] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[ProductCategoryKey] [int] NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimProductSubcategory_ProductSubcategoryKey] PRIMARY KEY CLUSTERED 
(
	[ProductSubcategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_DimProductSubcategory_ProductSubcategoryLabel] UNIQUE NONCLUSTERED 
(
	[ProductSubcategoryLabel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_ProductForecast]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_ProductForecast]
AS
SELECT     D.CalendarMonth, CONVERT(datetime, CONVERT(varchar(6), D.CalendarMonth) + '01', 120) AS ReportDate, C.ProductCategoryName, SUM(S.SalesQuantity) 
                      AS SalesQuantity, SUM(S.SalesAmount) AS SalesAmount
FROM         dbo.FactOnlineSales AS S INNER JOIN
                      dbo.DimProduct AS P ON S.ProductKey = P.ProductKey INNER JOIN
                      dbo.DimProductSubcategory AS SC ON P.ProductSubcategoryKey = SC.ProductSubcategoryKey INNER JOIN
                      dbo.DimProductCategory AS C ON SC.ProductCategoryKey = C.ProductCategoryKey INNER JOIN
                      dbo.DimDate AS D ON S.DateKey = D.Datekey
GROUP BY D.CalendarMonth, C.ProductCategoryName
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[GeographyKey] [int] NOT NULL,
	[CustomerLabel] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Title] [nvarchar](8) COLLATE Modern_Spanish_CI_AS NULL,
	[FirstName] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[MiddleName] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[LastName] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[NameStyle] [bit] NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [nchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[Suffix] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[Gender] [nvarchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[EmailAddress] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[YearlyIncome] [money] NULL,
	[TotalChildren] [tinyint] NULL,
	[NumberChildrenAtHome] [tinyint] NULL,
	[Education] [nvarchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[Occupation] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[HouseOwnerFlag] [nchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[NumberCarsOwned] [tinyint] NULL,
	[AddressLine1] [nvarchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[AddressLine2] [nvarchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[Phone] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[DateFirstPurchase] [date] NULL,
	[CustomerType] [nvarchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[CompanyName] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimCustomer_CustomerKey] PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_DimCustomer_CustomerLabel] UNIQUE NONCLUSTERED 
(
	[CustomerLabel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimGeography]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimGeography](
	[GeographyKey] [int] IDENTITY(1,1) NOT NULL,
	[GeographyTypeKey] [int] NOT NULL,
	[GeographyType] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ContinentName] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CityName] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[StateProvinceName] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[RegionCountryName] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[Geometry] [geometry] NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimGeography_GeographyKey] PRIMARY KEY CLUSTERED 
(
	[GeographyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_CustomerOrders]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_CustomerOrders]
AS
    SELECT
        pc.[ProductCategoryName]
        ,psc.ProductSubcategoryName AS ProductSubcategory
        ,p.ProductName AS Product
        ,c.[CustomerKey]
        ,g.RegionCountryName AS [Region]
        ,CASE
            WHEN Month(GetDate()) < Month(c.[BirthDate])
                THEN DateDiff(yy,c.[BirthDate],GetDate()) - 1
            WHEN Month(GetDate()) = Month(c.[BirthDate])
            AND Day(GetDate()) < Day(c.[BirthDate])
                THEN DateDiff(yy,c.[BirthDate],GetDate()) - 1
            ELSE DateDiff(yy,c.[BirthDate],GetDate())
        END AS [Age]
        ,CASE
            WHEN c.[YearlyIncome] < 40000 THEN 'Low'
            WHEN c.[YearlyIncome] > 100000 THEN 'High'
            ELSE 'Moderate'
        END AS [IncomeGroup]
        ,d.[CalendarYear]
        ,d.[FiscalYear]
        ,d.[CalendarMonth] AS [Month]
        ,f.[SalesOrderNumber] AS [OrderNumber]
        ,f.SalesOrderLineNumber AS LineNumber
        ,f.SalesQuantity AS Quantity
        ,f.SalesAmount AS Amount  
    FROM
        [dbo].[FactOnlineSales] f
    INNER JOIN [dbo].[DimDate] d
        ON f.[DateKey] = d.[DateKey]
    INNER JOIN [dbo].[DimProduct] p
        ON f.[ProductKey] = p.[ProductKey]
    INNER JOIN [dbo].[DimProductSubcategory] psc
        ON p.[ProductSubcategoryKey] = psc.[ProductSubcategoryKey]
    INNER JOIN [dbo].[DimProductCategory] pc
        ON psc.[ProductCategoryKey] = pc.[ProductCategoryKey]
    INNER JOIN [dbo].[DimCustomer] c
        ON f.[CustomerKey] = c.[CustomerKey]
    INNER JOIN [dbo].[DimGeography] g
        ON c.[GeographyKey] = g.[GeographyKey]
   
;

GO
/****** Object:  View [dbo].[V_OnlineSalesOrderDetail]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_OnlineSalesOrderDetail]
AS
SELECT     OrderNumber, LineNumber, Product
FROM         dbo.V_CustomerOrders
WHERE     (CalendarYear = 2007)
GO
/****** Object:  View [dbo].[V_Customer]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Customer]
AS
SELECT     C.CustomerKey, DATEDIFF(year, C.BirthDate, GETDATE()) AS Age, C.MaritalStatus, C.Gender, C.YearlyIncome, C.TotalChildren, C.NumberChildrenAtHome, C.Education, 
                      C.HouseOwnerFlag, C.NumberCarsOwned, S.Consumption
FROM         dbo.DimCustomer AS C INNER JOIN
                          (SELECT     CustomerKey, SUM(SalesAmount) AS Consumption
                            FROM          dbo.FactOnlineSales
                            GROUP BY CustomerKey) AS S ON C.CustomerKey = S.CustomerKey
WHERE     (C.CustomerType = 'Person')
GO
/****** Object:  Table [dbo].[DimPromotion]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPromotion](
	[PromotionKey] [int] IDENTITY(1,1) NOT NULL,
	[PromotionLabel] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[PromotionName] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[PromotionDescription] [nvarchar](255) COLLATE Modern_Spanish_CI_AS NULL,
	[DiscountPercent] [float] NULL,
	[PromotionType] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[PromotionCategory] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[MinQuantity] [int] NULL,
	[MaxQuantity] [int] NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimPromotion_PromotionKey] PRIMARY KEY CLUSTERED 
(
	[PromotionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_DimPromotion_PromotionLabel] UNIQUE NONCLUSTERED 
(
	[PromotionLabel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_CustomerPromotion]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_CustomerPromotion]
AS
SELECT     dbo.DimCustomer.CustomerKey, DATEDIFF(year, dbo.DimCustomer.BirthDate, GETDATE()) AS Age, dbo.DimCustomer.MaritalStatus, dbo.DimCustomer.Gender, 
                      dbo.DimCustomer.YearlyIncome, dbo.DimCustomer.TotalChildren, dbo.DimCustomer.NumberChildrenAtHome, dbo.DimCustomer.Education, 
                      dbo.DimCustomer.HouseOwnerFlag, dbo.DimCustomer.NumberCarsOwned, dbo.DimPromotion.PromotionName, dbo.DimPromotion.PromotionType, 
                      dbo.FactOnlineSales.ProductKey, dbo.FactOnlineSales.PromotionKey
FROM         dbo.DimCustomer INNER JOIN
                      dbo.FactOnlineSales ON dbo.DimCustomer.CustomerKey = dbo.FactOnlineSales.CustomerKey INNER JOIN
                      dbo.DimPromotion ON dbo.FactOnlineSales.PromotionKey = dbo.DimPromotion.PromotionKey
WHERE     (dbo.DimCustomer.CustomerType = 'Person') AND (dbo.FactOnlineSales.ProductKey >= 1144) AND (dbo.FactOnlineSales.ProductKey <= 1246)
GO
/****** Object:  View [dbo].[V_OnlineSalesOrder]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_OnlineSalesOrder]
AS
SELECT DISTINCT OrderNumber, CustomerKey, Region, IncomeGroup
FROM         dbo.V_CustomerOrders
WHERE     (CalendarYear = 2007)
GO
/****** Object:  Table [dbo].[DimAccount]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAccount](
	[AccountKey] [int] IDENTITY(1,1) NOT NULL,
	[ParentAccountKey] [int] NULL,
	[AccountLabel] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[AccountName] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[AccountDescription] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[AccountType] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Operator] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[CustomMembers] [nvarchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[ValueType] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[CustomMemberOptions] [nvarchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimAccount_AccountKey] PRIMARY KEY CLUSTERED 
(
	[AccountKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimChannel]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimChannel](
	[ChannelKey] [int] IDENTITY(1,1) NOT NULL,
	[ChannelLabel] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ChannelName] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ChannelDescription] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimChannel_ChannelKey] PRIMARY KEY CLUSTERED 
(
	[ChannelKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCurrency]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCurrency](
	[CurrencyKey] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyLabel] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CurrencyName] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CurrencyDescription] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimCurrency_CurrencyKey] PRIMARY KEY CLUSTERED 
(
	[CurrencyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_DimCurrency_CurrencyLabel] UNIQUE NONCLUSTERED 
(
	[CurrencyLabel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEmployee]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEmployee](
	[EmployeeKey] [int] IDENTITY(1,1) NOT NULL,
	[ParentEmployeeKey] [int] NULL,
	[FirstName] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[LastName] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MiddleName] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Title] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[HireDate] [date] NULL,
	[BirthDate] [date] NULL,
	[EmailAddress] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Phone] [nvarchar](25) COLLATE Modern_Spanish_CI_AS NULL,
	[MaritalStatus] [nchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[EmergencyContactName] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[EmergencyContactPhone] [nvarchar](25) COLLATE Modern_Spanish_CI_AS NULL,
	[SalariedFlag] [bit] NULL,
	[Gender] [nchar](1) COLLATE Modern_Spanish_CI_AS NULL,
	[PayFrequency] [tinyint] NULL,
	[BaseRate] [money] NULL,
	[VacationHours] [smallint] NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SalesPersonFlag] [bit] NOT NULL,
	[DepartmentName] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Status] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[ImageUrl] [nvarchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[ProfileUrl] [nvarchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimEmployee_EmployeeKey] PRIMARY KEY CLUSTERED 
(
	[EmployeeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEntity]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEntity](
	[EntityKey] [int] IDENTITY(1,1) NOT NULL,
	[EntityLabel] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[ParentEntityKey] [int] NULL,
	[ParentEntityLabel] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[EntityName] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[EntityDescription] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[EntityType] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimEntity_EntityKey] PRIMARY KEY CLUSTERED 
(
	[EntityKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimMachine]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimMachine](
	[MachineKey] [int] NOT NULL,
	[MachineLabel] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[StoreKey] [int] NOT NULL,
	[MachineType] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MachineName] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MachineDescription] [nvarchar](200) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[VendorName] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MachineOS] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MachineSource] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MachineHardware] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[MachineSoftware] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Status] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ServiceStartDate] [datetime] NOT NULL,
	[DecommissionDate] [datetime] NULL,
	[LastModifiedDate] [datetime] NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimMachine_MachineKey] PRIMARY KEY CLUSTERED 
(
	[MachineKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimOutage]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimOutage](
	[OutageKey] [int] IDENTITY(1,1) NOT NULL,
	[OutageLabel] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[OutageName] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[OutageDescription] [nvarchar](200) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[OutageType] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[OutageTypeDescription] [nvarchar](200) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[OutageSubType] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[OutageSubTypeDescription] [nvarchar](200) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimOutage_OutageKey] PRIMARY KEY CLUSTERED 
(
	[OutageKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSalesTerritory]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSalesTerritory](
	[SalesTerritoryKey] [int] IDENTITY(1,1) NOT NULL,
	[GeographyKey] [int] NOT NULL,
	[SalesTerritoryLabel] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[SalesTerritoryName] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[SalesTerritoryRegion] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[SalesTerritoryCountry] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[SalesTerritoryGroup] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[SalesTerritoryLevel] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[SalesTerritoryManager] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimSalesTerritory_SalesTerritoryKey] PRIMARY KEY CLUSTERED 
(
	[SalesTerritoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_DimSalesTerritory_SalesTerritoryLabel] UNIQUE NONCLUSTERED 
(
	[SalesTerritoryLabel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimScenario]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimScenario](
	[ScenarioKey] [int] IDENTITY(1,1) NOT NULL,
	[ScenarioLabel] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ScenarioName] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ScenarioDescription] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimScenario] PRIMARY KEY CLUSTERED 
(
	[ScenarioKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStore]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStore](
	[StoreKey] [int] IDENTITY(1,1) NOT NULL,
	[GeographyKey] [int] NOT NULL,
	[StoreManager] [int] NULL,
	[StoreType] [nvarchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[StoreName] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[StoreDescription] [nvarchar](300) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Status] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[OpenDate] [datetime] NOT NULL,
	[CloseDate] [datetime] NULL,
	[EntityKey] [int] NULL,
	[ZipCode] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ZipCodeExtension] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[StorePhone] [nvarchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[StoreFax] [nvarchar](14) COLLATE Modern_Spanish_CI_AS NULL,
	[AddressLine1] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[AddressLine2] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[CloseReason] [nvarchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[EmployeeCount] [int] NULL,
	[SellingAreaSize] [float] NULL,
	[LastRemodelDate] [datetime] NULL,
	[GeoLocation] [geography] NULL,
	[Geometry] [geometry] NULL,
	[ImageUrl] [nvarchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimStore_StoreKey] PRIMARY KEY CLUSTERED 
(
	[StoreKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactExchangeRate]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactExchangeRate](
	[ExchangeRateKey] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[DateKey] [datetime] NOT NULL,
	[AverageRate] [float] NOT NULL,
	[EndOfDayRate] [float] NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FactExchangeRate_ExchangeRateKey] PRIMARY KEY CLUSTERED 
(
	[ExchangeRateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactInventory]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactInventory](
	[InventoryKey] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [datetime] NOT NULL,
	[StoreKey] [int] NOT NULL,
	[ProductKey] [int] NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[OnHandQuantity] [int] NOT NULL,
	[OnOrderQuantity] [int] NOT NULL,
	[SafetyStockQuantity] [int] NULL,
	[UnitCost] [money] NOT NULL,
	[DaysInStock] [int] NULL,
	[MinDayInStock] [int] NULL,
	[MaxDayInStock] [int] NULL,
	[Aging] [int] NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FactInventory_InventoryKey] PRIMARY KEY CLUSTERED 
(
	[InventoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactITMachine]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactITMachine](
	[ITMachinekey] [int] IDENTITY(1,1) NOT NULL,
	[MachineKey] [int] NOT NULL,
	[Datekey] [datetime] NOT NULL,
	[CostAmount] [money] NULL,
	[CostType] [nvarchar](200) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FactITMachine] PRIMARY KEY CLUSTERED 
(
	[ITMachinekey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactITSLA]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactITSLA](
	[ITSLAkey] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [datetime] NOT NULL,
	[StoreKey] [int] NOT NULL,
	[MachineKey] [int] NOT NULL,
	[OutageKey] [int] NOT NULL,
	[OutageStartTime] [datetime] NOT NULL,
	[OutageEndTime] [datetime] NOT NULL,
	[DownTime] [int] NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FactITSLA_ITSLAKey] PRIMARY KEY CLUSTERED 
(
	[ITSLAkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSales]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSales](
	[SalesKey] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [datetime] NOT NULL,
	[channelKey] [int] NOT NULL,
	[StoreKey] [int] NOT NULL,
	[ProductKey] [int] NOT NULL,
	[PromotionKey] [int] NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[UnitCost] [money] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[SalesQuantity] [int] NOT NULL,
	[ReturnQuantity] [int] NOT NULL,
	[ReturnAmount] [money] NULL,
	[DiscountQuantity] [int] NULL,
	[DiscountAmount] [money] NULL,
	[TotalCost] [money] NOT NULL,
	[SalesAmount] [money] NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FactSales_SalesKey] PRIMARY KEY CLUSTERED 
(
	[SalesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSalesQuota]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSalesQuota](
	[SalesQuotaKey] [int] IDENTITY(1,1) NOT NULL,
	[ChannelKey] [int] NOT NULL,
	[StoreKey] [int] NOT NULL,
	[ProductKey] [int] NOT NULL,
	[DateKey] [datetime] NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[ScenarioKey] [int] NOT NULL,
	[SalesQuantityQuota] [int] NOT NULL,
	[SalesAmountQuota] [money] NOT NULL,
	[GrossMarginQuota] [money] NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FactSalesQuota_SalesQuotaKey] PRIMARY KEY CLUSTERED 
(
	[SalesQuotaKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactStrategyPlan]    Script Date: 3/25/2020 5:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactStrategyPlan](
	[StrategyPlanKey] [int] IDENTITY(1,1) NOT NULL,
	[Datekey] [datetime] NOT NULL,
	[EntityKey] [int] NOT NULL,
	[ScenarioKey] [int] NOT NULL,
	[AccountKey] [int] NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[ProductCategoryKey] [int] NULL,
	[Amount] [money] NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FactStrategyPlan_StrategyPlanKey] PRIMARY KEY CLUSTERED 
(
	[StrategyPlanKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimEntity] ADD  CONSTRAINT [DF_DimEntity_Status]  DEFAULT (N'Current') FOR [Status]
GO
ALTER TABLE [dbo].[DimCustomer]  WITH CHECK ADD  CONSTRAINT [FK_DimCustomer_DimGeography] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
ALTER TABLE [dbo].[DimCustomer] CHECK CONSTRAINT [FK_DimCustomer_DimGeography]
GO
ALTER TABLE [dbo].[DimEmployee]  WITH CHECK ADD  CONSTRAINT [FK_DimEmployee_DimEmployee] FOREIGN KEY([ParentEmployeeKey])
REFERENCES [dbo].[DimEmployee] ([EmployeeKey])
GO
ALTER TABLE [dbo].[DimEmployee] CHECK CONSTRAINT [FK_DimEmployee_DimEmployee]
GO
ALTER TABLE [dbo].[DimMachine]  WITH CHECK ADD  CONSTRAINT [FK_DimMachine_DimStore] FOREIGN KEY([StoreKey])
REFERENCES [dbo].[DimStore] ([StoreKey])
GO
ALTER TABLE [dbo].[DimMachine] CHECK CONSTRAINT [FK_DimMachine_DimStore]
GO
ALTER TABLE [dbo].[DimProduct]  WITH CHECK ADD  CONSTRAINT [FK_DimProduct_DimProductSubcategory] FOREIGN KEY([ProductSubcategoryKey])
REFERENCES [dbo].[DimProductSubcategory] ([ProductSubcategoryKey])
GO
ALTER TABLE [dbo].[DimProduct] CHECK CONSTRAINT [FK_DimProduct_DimProductSubcategory]
GO
ALTER TABLE [dbo].[DimProductSubcategory]  WITH CHECK ADD  CONSTRAINT [FK_DimProductSubcategory_DimProductCategory] FOREIGN KEY([ProductCategoryKey])
REFERENCES [dbo].[DimProductCategory] ([ProductCategoryKey])
GO
ALTER TABLE [dbo].[DimProductSubcategory] CHECK CONSTRAINT [FK_DimProductSubcategory_DimProductCategory]
GO
ALTER TABLE [dbo].[DimSalesTerritory]  WITH CHECK ADD  CONSTRAINT [FK_DimSalesTerritory_DimGeography] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
ALTER TABLE [dbo].[DimSalesTerritory] CHECK CONSTRAINT [FK_DimSalesTerritory_DimGeography]
GO
ALTER TABLE [dbo].[DimStore]  WITH CHECK ADD  CONSTRAINT [FK_DimStore_DimGeography] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
ALTER TABLE [dbo].[DimStore] CHECK CONSTRAINT [FK_DimStore_DimGeography]
GO
ALTER TABLE [dbo].[FactExchangeRate]  WITH CHECK ADD  CONSTRAINT [FK_FactExchangeRate_DimCurrency] FOREIGN KEY([CurrencyKey])
REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactExchangeRate] CHECK CONSTRAINT [FK_FactExchangeRate_DimCurrency]
GO
ALTER TABLE [dbo].[FactExchangeRate]  WITH CHECK ADD  CONSTRAINT [FK_FactExchangeRate_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactExchangeRate] CHECK CONSTRAINT [FK_FactExchangeRate_DimDate]
GO
ALTER TABLE [dbo].[FactInventory]  WITH CHECK ADD  CONSTRAINT [FK_FactInventory_DimCurrency] FOREIGN KEY([CurrencyKey])
REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactInventory] CHECK CONSTRAINT [FK_FactInventory_DimCurrency]
GO
ALTER TABLE [dbo].[FactInventory]  WITH CHECK ADD  CONSTRAINT [FK_FactInventory_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactInventory] CHECK CONSTRAINT [FK_FactInventory_DimDate]
GO
ALTER TABLE [dbo].[FactInventory]  WITH CHECK ADD  CONSTRAINT [FK_FactInventory_DimProduct] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dbo].[FactInventory] CHECK CONSTRAINT [FK_FactInventory_DimProduct]
GO
ALTER TABLE [dbo].[FactInventory]  WITH CHECK ADD  CONSTRAINT [FK_FactInventory_DimStore] FOREIGN KEY([StoreKey])
REFERENCES [dbo].[DimStore] ([StoreKey])
GO
ALTER TABLE [dbo].[FactInventory] CHECK CONSTRAINT [FK_FactInventory_DimStore]
GO
ALTER TABLE [dbo].[FactITMachine]  WITH CHECK ADD  CONSTRAINT [FK_FactITMachine_DimDate] FOREIGN KEY([Datekey])
REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactITMachine] CHECK CONSTRAINT [FK_FactITMachine_DimDate]
GO
ALTER TABLE [dbo].[FactITMachine]  WITH CHECK ADD  CONSTRAINT [FK_FactITMachine_DimMachine] FOREIGN KEY([MachineKey])
REFERENCES [dbo].[DimMachine] ([MachineKey])
GO
ALTER TABLE [dbo].[FactITMachine] CHECK CONSTRAINT [FK_FactITMachine_DimMachine]
GO
ALTER TABLE [dbo].[FactITSLA]  WITH CHECK ADD  CONSTRAINT [FK_FactITSLA_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactITSLA] CHECK CONSTRAINT [FK_FactITSLA_DimDate]
GO
ALTER TABLE [dbo].[FactITSLA]  WITH CHECK ADD  CONSTRAINT [FK_FactITSLA_DimMachine] FOREIGN KEY([MachineKey])
REFERENCES [dbo].[DimMachine] ([MachineKey])
GO
ALTER TABLE [dbo].[FactITSLA] CHECK CONSTRAINT [FK_FactITSLA_DimMachine]
GO
ALTER TABLE [dbo].[FactITSLA]  WITH CHECK ADD  CONSTRAINT [FK_FactITSLA_DimOutage] FOREIGN KEY([OutageKey])
REFERENCES [dbo].[DimOutage] ([OutageKey])
GO
ALTER TABLE [dbo].[FactITSLA] CHECK CONSTRAINT [FK_FactITSLA_DimOutage]
GO
ALTER TABLE [dbo].[FactITSLA]  WITH CHECK ADD  CONSTRAINT [FK_FactITSLA_DimStore] FOREIGN KEY([StoreKey])
REFERENCES [dbo].[DimStore] ([StoreKey])
GO
ALTER TABLE [dbo].[FactITSLA] CHECK CONSTRAINT [FK_FactITSLA_DimStore]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimChannel] FOREIGN KEY([channelKey])
REFERENCES [dbo].[DimChannel] ([ChannelKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimChannel]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimCurrency] FOREIGN KEY([CurrencyKey])
REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimCurrency]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimDate]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimProduct] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimProduct]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimPromotion] FOREIGN KEY([PromotionKey])
REFERENCES [dbo].[DimPromotion] ([PromotionKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimPromotion]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimStore] FOREIGN KEY([StoreKey])
REFERENCES [dbo].[DimStore] ([StoreKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimStore]
GO
ALTER TABLE [dbo].[FactSalesQuota]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesQuota_DimChannel] FOREIGN KEY([ChannelKey])
REFERENCES [dbo].[DimChannel] ([ChannelKey])
GO
ALTER TABLE [dbo].[FactSalesQuota] CHECK CONSTRAINT [FK_FactSalesQuota_DimChannel]
GO
ALTER TABLE [dbo].[FactSalesQuota]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesQuota_DimCurrency] FOREIGN KEY([CurrencyKey])
REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactSalesQuota] CHECK CONSTRAINT [FK_FactSalesQuota_DimCurrency]
GO
ALTER TABLE [dbo].[FactSalesQuota]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesQuota_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactSalesQuota] CHECK CONSTRAINT [FK_FactSalesQuota_DimDate]
GO
ALTER TABLE [dbo].[FactSalesQuota]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesQuota_DimProduct] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dbo].[FactSalesQuota] CHECK CONSTRAINT [FK_FactSalesQuota_DimProduct]
GO
ALTER TABLE [dbo].[FactSalesQuota]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesQuota_DimScenario] FOREIGN KEY([ScenarioKey])
REFERENCES [dbo].[DimScenario] ([ScenarioKey])
GO
ALTER TABLE [dbo].[FactSalesQuota] CHECK CONSTRAINT [FK_FactSalesQuota_DimScenario]
GO
ALTER TABLE [dbo].[FactSalesQuota]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesQuota_DimStore] FOREIGN KEY([StoreKey])
REFERENCES [dbo].[DimStore] ([StoreKey])
GO
ALTER TABLE [dbo].[FactSalesQuota] CHECK CONSTRAINT [FK_FactSalesQuota_DimStore]
GO
ALTER TABLE [dbo].[FactStrategyPlan]  WITH CHECK ADD  CONSTRAINT [FK_FactStrategyPlan_DimAccount] FOREIGN KEY([AccountKey])
REFERENCES [dbo].[DimAccount] ([AccountKey])
GO
ALTER TABLE [dbo].[FactStrategyPlan] CHECK CONSTRAINT [FK_FactStrategyPlan_DimAccount]
GO
ALTER TABLE [dbo].[FactStrategyPlan]  WITH CHECK ADD  CONSTRAINT [FK_FactStrategyPlan_DimCurrency] FOREIGN KEY([CurrencyKey])
REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactStrategyPlan] CHECK CONSTRAINT [FK_FactStrategyPlan_DimCurrency]
GO
ALTER TABLE [dbo].[FactStrategyPlan]  WITH CHECK ADD  CONSTRAINT [FK_FactStrategyPlan_DimDate] FOREIGN KEY([Datekey])
REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactStrategyPlan] CHECK CONSTRAINT [FK_FactStrategyPlan_DimDate]
GO
ALTER TABLE [dbo].[FactStrategyPlan]  WITH CHECK ADD  CONSTRAINT [FK_FactStrategyPlan_DimEntity] FOREIGN KEY([EntityKey])
REFERENCES [dbo].[DimEntity] ([EntityKey])
GO
ALTER TABLE [dbo].[FactStrategyPlan] CHECK CONSTRAINT [FK_FactStrategyPlan_DimEntity]
GO
ALTER TABLE [dbo].[FactStrategyPlan]  WITH CHECK ADD  CONSTRAINT [FK_FactStrategyPlan_DimProductCategory] FOREIGN KEY([ProductCategoryKey])
REFERENCES [dbo].[DimProductCategory] ([ProductCategoryKey])
GO
ALTER TABLE [dbo].[FactStrategyPlan] CHECK CONSTRAINT [FK_FactStrategyPlan_DimProductCategory]
GO
ALTER TABLE [dbo].[FactStrategyPlan]  WITH CHECK ADD  CONSTRAINT [FK_FactStrategyPlan_DimScenario] FOREIGN KEY([ScenarioKey])
REFERENCES [dbo].[DimScenario] ([ScenarioKey])
GO
ALTER TABLE [dbo].[FactStrategyPlan] CHECK CONSTRAINT [FK_FactStrategyPlan_DimScenario]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 6
               Left = 279
               Bottom = 95
               Right = 439
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Customer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Customer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[28] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -384
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DimCustomer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 319
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "FactOnlineSales"
            Begin Extent = 
               Top = 6
               Left = 279
               Bottom = 311
               Right = 477
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "DimPromotion"
            Begin Extent = 
               Top = 6
               Left = 515
               Bottom = 250
               Right = 705
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2775
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CustomerPromotion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CustomerPromotion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "V_CustomerOrders"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_OnlineSalesOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_OnlineSalesOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "V_CustomerOrders"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_OnlineSalesOrderDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_OnlineSalesOrderDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[36] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "S"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 65
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 252
               Bottom = 65
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SC"
            Begin Extent = 
               Top = 66
               Left = 38
               Bottom = 125
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 66
               Left = 252
               Bottom = 125
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 185
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 1575
         Table = 1170
         Output = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ProductForecast'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ProductForecast'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ProductForecast'
GO
USE [master]
GO
ALTER DATABASE [ContosoSpanish] SET  READ_WRITE 
GO
