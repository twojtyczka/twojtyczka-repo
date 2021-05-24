USE AdventureWorks2019;

-- 1. Przygotuj blok anonimowy, który: - znajdzie średnią stawkę wynagrodzenia pracowników, - wyświetli szczegóły pracowników, których stawka wynagrodzenia jest niższa niż średnia.

BEGIN
DECLARE @srednia varchar(10)
SELECT @srednia = AVG(Rate) FROM HumanResources.EmployeePayHistory
PRINT 'Srednia stawka wynagrodzenia pracownikow wynosi: ' + @srednia;

SELECT * FROM HumanResources.Employee
	JOIN HumanResources.EmployeePayHistory ON HumanResources.Employee.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID
	WHERE Rate < (SELECT AVG(Rate) FROM HumanResources.EmployeePayHistory)
END;

-- 2. Utwórz funkcję, która zwróci datę wysyłki określonego zamówienia.

GO
CREATE OR ALTER FUNCTION data_wysylki(@zamowienieID int)
RETURNS varchar(100)
BEGIN
	DECLARE @data datetime
	SELECT @data = (SELECT DueDate FROM Purchasing.PurchaseOrderDetail WHERE PurchaseOrderDetailID = @zamowienieID);
	RETURN @data
END;
GO

SELECT dbo.data_wysylki(1) AS Data_wysylki;

-- 3. Utwórz procedurę składowaną, która jako parametr przyjmuję nazwę produktu, a jako rezultat wyświetla jego identyfikator, numer i dostępność.

GO
CREATE OR ALTER PROCEDURE procedura1(@nazwa VARCHAR(100))
AS
SELECT Name, Production.Product.ProductID, ProductNumber, Quantity
	FROM Production.Product
		JOIN Production.ProductInventory ON Production.Product.ProductID = Production.ProductInventory.ProductID WHERE Name = @nazwa
GO

EXEC procedura1 @nazwa = 'Bearing Ball';

-- 4. Utwórz funkcję, która zwraca numer karty kredytowej dla konkretnego zamówienia.

GO
CREATE OR ALTER FUNCTION karta_kredytowa(@zamowienie int)
RETURNS varchar(20)
BEGIN
    DECLARE @numer_karty varchar(20)
    DECLARE @ID_karty int

	SELECT @ID_karty = CreditCardID FROM Sales.SalesOrderHeader 
	JOIN Sales.Customer on Sales.Customer.CustomerID = Sales.SalesOrderHeader.CustomerID
	WHERE Sales.SalesOrderHeader.SalesOrderID = @zamowienie;

	SELECT @numer_karty = CardNumber FROM Sales.CreditCard
	WHERE Sales.CreditCard.CreditCardID = @ID_karty;
	RETURN @numer_karty
END;
GO

SELECT dbo.karta_kredytowa(43659) AS Numer_karty_kredytowej;

-- 5. Utwórz procedurę składowaną, która jako parametry wejściowe przyjmuje dwie liczby, num1 i num2, a zwraca wynik ich dzielenia. Ponadto wartość num1 powinna zawsze być większa niż wartość num2. Jeżeli wartość num1 jest mniejsza niż num2, wygeneruj komunikat o błędzie „Niewłaściwie zdefiniowałeś dane wejściowe”.

GO
CREATE OR ALTER PROCEDURE procedura2(@num1 int, @num2 int)
AS
BEGIN
IF @num1 > @num2
	PRINT (@num1/@num2);
ELSE
	PRINT 'Niewlasciwie zdefiniowales dane wejsciowe.';
END
GO

EXEC procedura2 @num1 = 9, @num2 = 3;

-- 6. Napisz procedurę, która jako parametr przyjmie NationalIDNumber danej osoby, a zwróci stanowisko oraz liczbę dni urlopowych i chorobowych.

GO
CREATE OR ALTER PROCEDURE procedura3(@id int)
AS
SELECT NationalIDNumber AS NationalIDNumber, JobTitle AS JobTitle, VacationHours AS VacationHours, SickLeaveHours AS SickLeaveHours FROM HumanResources.Employee
	WHERE NationalIDNumber = @id;
GO

EXEC procedura3 @id = 295847284;

-- 7. Napisz procedurę będącą kalkulatorem walutowym. Wykorzystaj dwie tabele: Sales.Currency oraz Sales.CurrencyRate. Parametrami wejściowymi mają być: kwota, waluty oraz data (CurrencyRateDate). Przyjmij, iż zawsze jedną ze stron jest dolar amerykański (USD). Zaimplementuj kalkulację obustronną, tj: 1400 USD → PLN lub PLN → USD

GO
CREATE OR ALTER PROCEDURE procedura4(@kwota int, @waluta1 char(3), @waluta2 char(3), @data datetime)
AS
	DECLARE @kurs float

	SELECT @kurs = AverageRate FROM Sales.CurrencyRate WHERE ToCurrencyCode = @waluta2
	PRINT @waluta1 + ': ' + CAST(@kwota AS VARCHAR(10)) + ' --> ' + @waluta2 + ': ' + CAST(@kwota*@kurs AS VARCHAR(10));

	DECLARE @kurs_odwrotny float
	SET @kurs_odwrotny = 1/@kurs

	SELECT @kurs = AverageRate FROM Sales.CurrencyRate WHERE ToCurrencyCode = @waluta2
	PRINT @waluta2 + ': ' + CAST(@kwota AS VARCHAR(10)) + ' --> ' + @waluta1 + ': ' + CAST(@kwota*@kurs_odwrotny AS VARCHAR(10));
GO

EXEC procedura4 @kwota = 200, @waluta1 = 'USD', @waluta2 = 'EUR', @data = '2011-05-31 00:00:00.000';