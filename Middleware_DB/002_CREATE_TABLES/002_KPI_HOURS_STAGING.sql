USE ACCELA_KPI
GO

CREATE TABLE middleware.KPI_Hours_Staging
(
    Agency_ID NVARCHAR(15) NOT NULL,
    Module_Name NVARCHAR(50) NOT NULL,

    UI_State NVARCHAR(MAX),

    Is_Dirty BIT DEFAULT 0,
    Is_Committed BIT DEFAULT 0,

    Session_ID UNIQUEIDENTIFIER,

    Updated_At DATETIME2 DEFAULT GETDATE(),
    Committed_At DATETIME2,

    CONSTRAINT PK_KPI_Hours
    PRIMARY KEY (Agency_ID, Module_Name)
)
GO