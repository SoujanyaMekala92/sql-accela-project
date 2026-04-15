USE ACCELA_KPI
GO

CREATE TABLE middleware.KPI_Workflow_Staging
(
    Agency_ID NVARCHAR(15) NOT NULL,
    Workflow_Name NVARCHAR(100) NOT NULL,

    Total_Count INT NULL,
    Mapped_Count INT NULL,

    UI_State NVARCHAR(MAX) NULL,

    Is_Dirty BIT DEFAULT 0,
    Is_Committed BIT DEFAULT 0,

    Session_ID UNIQUEIDENTIFIER NULL,

    Updated_At DATETIME2 DEFAULT GETDATE(),
    Committed_At DATETIME2 NULL,

    CONSTRAINT PK_KPI_Workflow
    PRIMARY KEY (Agency_ID, Workflow_Name)
)
GO