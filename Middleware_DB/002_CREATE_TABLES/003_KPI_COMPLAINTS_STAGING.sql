USE ACCELA_KPI
GO

CREATE TABLE middleware.KPI_Complaints_Staging
(
    Agency_ID NVARCHAR(15) NOT NULL,
    Mapping_ID UNIQUEIDENTIFIER DEFAULT NEWID(),

    UI_State NVARCHAR(MAX),

    Is_Dirty BIT DEFAULT 0,
    Is_Committed BIT DEFAULT 0,

    Updated_At DATETIME2 DEFAULT GETDATE(),

    CONSTRAINT PK_KPI_Complaints
    PRIMARY KEY (Agency_ID, Mapping_ID)
)
GO