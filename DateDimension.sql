
SET ANSI_NULLS ON
    GO

    SET QUOTED_IDENTIFIER ON
    GO

    IF OBJECT_ID('EDW.DimDate') IS NOT NULL
    DROP TABLE EDW.DimDate;
Create Table EDW.DimDate
(
DateKey int,
FullDateAlternateKey date,
DayNumberOfWeek int,
EnglishDayNameOfWeek nvarchar(50), 
SpanishDayNameOfWeek nvarchar(50),
FrenchDayNameOfWeek  nvarchar(50),
DayNumberOfMonth  int,
DayNumberOfYear int,
WeekNumberOfYear int,
EnglishMonthName nvarchar(50),
SpanishMonthName nvarchar(50),
FrenchMonthName nvarchar(50),
MonthNumberOfYear int,
CalendarQuarter int,
CalendarYear int,
CalendarSemester int,
FiscalQuarter int,
FiscalYear int,
FiscalSemester int,
LoadDate datetime default getdate(), 
Constraint DateKey primary key(DateKey)
)
 BEGIN
SET NOCOUNT ON
declare @endDate date ='2099-12-31'

---- dimdate --> 
   declare @startDate date = (
								select   min(convert(date,mindate))  from 
							  (
									select min(Orderdate) minDate   from  AcadaCompany_ODS.ods.TransactionTable
										
 								) a
							)

declare  @nofDays  int  =datediff(day,@StartDate, @EndDate)    ----200080
declare  @Currentday int= 0
declare @currentDate date

 IF (select OBJECT_ID('EDW.DimDate')) is not null 
    TRUNCATE TABLE EDW.DimDate

WHILE @Currentday <=@nofDays    ---     0 <=2000480
BEGIN 
     Select @CurrentDate=(DateAdd(day,@currentday,@StartDate))
 
 Insert Into EDW.DimDate(DateKey, FullDateAlternateKey, DayNumberOfWeek, EnglishDayNameOfWeek, SpanishDayNameOfWeek,FrenchDayNameOfWeek, 
 DayNumberOfMonth, DayNumberOfYear, WeekNumberOfYear,EnglishMonthName, SpanishMonthName, FrenchMonthName,MonthNumberOfYear, CalendarQuarter, 
 CalendarYear, CalendarSemester, FiscalQuarter, FiscalYear, FiscalSemester,LoadDate)  
  
    SELECT
	    Convert(int,convert(nvarchar(8),@CurrentDate,112)), @CurrentDate,DATEPART(DW, @CurrentDate), DATENAME(DW, @CurrentDate),
		CASE 
            WHEN DATENAME(DW, @CurrentDate) = 'Saturday'  THEN 'Sábado'
            WHEN DATENAME(DW, @CurrentDate) = 'Sunday'    THEN 'Domingo'
            WHEN DATENAME(DW, @CurrentDate) = 'Monday'    THEN 'Lunes'
            WHEN DATENAME(DW, @CurrentDate) = 'Tuesday'   THEN 'Martes'
            WHEN DATENAME(DW, @CurrentDate) = 'Wednesday' THEN 'Miércoles'
            WHEN DATENAME(DW, @CurrentDate) = 'Thursday'  THEN 'Jueves'
            WHEN DATENAME(DW, @CurrentDate) = 'Friday'    THEN 'Viernes'
            END,

        CASE 
            WHEN DATENAME(DW, @CurrentDate) = 'Saturday'  THEN 'Samedi'
            WHEN DATENAME(DW, @CurrentDate) = 'Sunday'    THEN 'Dimanche'
            WHEN DATENAME(DW, @CurrentDate) = 'Monday'    THEN 'Lundi'
            WHEN DATENAME(DW, @CurrentDate) = 'Tuesday'   THEN 'Mardi'
            WHEN DATENAME(DW, @CurrentDate) = 'Wednesday' THEN 'Mercredi'
            WHEN DATENAME(DW, @CurrentDate) = 'Thursday'  THEN 'Jeudi'
            WHEN DATENAME(DW, @CurrentDate) = 'Friday'    THEN 'Vendredi'
            END,

            DATEPART(DD, @CurrentDate), 
            DATEPART(dayofyear, @CurrentDate),
            DATEPART(WK, @CurrentDate),
            DATENAME(MONTH, @CurrentDate),

        CASE 
            WHEN DATENAME(MONTH, @CurrentDate) = 'January'    THEN'Enero'
            WHEN DATENAME(MONTH, @CurrentDate) = 'February'   THEN 'Febrero'
            WHEN DATENAME(MONTH, @CurrentDate) = 'March'      THEN    'Marzo'
            WHEN DATENAME(MONTH, @CurrentDate) = 'April'      THEN 'Abril'
            WHEN DATENAME(MONTH, @CurrentDate) = 'May'        THEN 'Mayo'
            WHEN DATENAME(MONTH, @CurrentDate) = 'June'       THEN 'Junio'
            WHEN DATENAME(MONTH, @CurrentDate) = 'July'       THEN 'Julio'
            WHEN DATENAME(MONTH, @CurrentDate) = 'August'     THEN 'Agosto'
            WHEN DATENAME(MONTH, @CurrentDate) = 'September'  THEN 'Septiembre'
            WHEN DATENAME(MONTH, @CurrentDate) = 'October'    THEN 'Octubre'
            WHEN DATENAME(MONTH, @CurrentDate) = 'November'   THEN 'Noviembre'
            WHEN DATENAME(MONTH, @CurrentDate) = 'December'   THEN 'Diciembre'
            END,

        CASE 
            WHEN DATENAME(MONTH, @CurrentDate) = 'January'    THEN 'Janvier'
            WHEN DATENAME(MONTH, @CurrentDate) = 'February'   THEN 'Février'
            WHEN DATENAME(MONTH, @CurrentDate) = 'March'      THEN 'Mars'
            WHEN DATENAME(MONTH, @CurrentDate) = 'April'      THEN 'Avril'
            WHEN DATENAME(MONTH, @CurrentDate) = 'May'        THEN 'Mai'
            WHEN DATENAME(MONTH, @CurrentDate) = 'June'       THEN 'Juin'
            WHEN DATENAME(MONTH, @CurrentDate) = 'July'       THEN 'Juillet'
            WHEN DATENAME(MONTH, @CurrentDate) = 'August'     THEN 'Août'
            WHEN DATENAME(MONTH, @CurrentDate) = 'September'  THEN 'Septembre'
            WHEN DATENAME(MONTH, @CurrentDate) = 'October'    THEN 'Octobre'
            WHEN DATENAME(MONTH, @CurrentDate) = 'November'   THEN 'Novembre'
            WHEN DATENAME(MONTH, @CurrentDate) = 'December'   THEN 'Décembre'
            END,

            DATEPART(MONTH, @CurrentDate), DATEPART(Quarter, @CurrentDate),YEAR(@CurrentDate),

        CASE 
            WHEN DATEPART(MONTH, @CurrentDate) IN (1,2,3,4,5,6)
            THEN 1
            WHEN DATEPART(MONTH, @CurrentDate) IN (7,8,9,10,11,12)
            THEN 2
            END,

        CASE 
            WHEN DATEPART(MONTH, GetDATE()) IN (7, 8, 9)    THEN 1
            WHEN DATEPART(MONtH, GetDATE()) IN (10, 11, 12) THEN 2
            WHEN DATEPART(MONtH, GetDATE()) IN (1, 2, 3)    THEN 3
            WHEN DATEPART(MONtH, GetDATE()) IN (4, 5, 6)    THEN 4
            END,

        CASE 
            WHEN MONTH(@CurrentDate) < 7  THEN YEAR(@CurrentDate) --Assuming the fiscal year beings on the first of July 
            ELSE YEAR(@CurrentDate) + 1 --if the date is less than July, then the Fiscal Year is equal to the Calendar Year
            END ,

        CASE 
            WHEN DATEPART(MONTH, @CurrentDate) IN (7,8,9,10,11,12)    THEN 1
            WHEN DATEPART(MONTH, @CurrentDate) IN (1,2,3,4,5,6)       THEN 2
            END, getdate()
			
	 select  @Currentday=@Currentday+1
END
    END

   SELECT * FROM EDW.DimDate;
