USE ACCELA_KPI
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'middleware')
BEGIN
    EXEC('CREATE SCHEMA middleware')
END
GO







---SELECT name FROM sys.databases