USE ACCELA_KPI
GO

CREATE TABLE middleware.KPI_AI_Feedback_Log
(
    Feedback_ID UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,

    Agency_ID NVARCHAR(15),

    Workflow_Key NVARCHAR(500),

    Suggested_Map NVARCHAR(MAX),
    Final_Mapping NVARCHAR(MAX),

    Feedback_Type NVARCHAR(20),

    AI_Confidence FLOAT,

    Reference_IDs NVARCHAR(MAX),

    Override_Reason NVARCHAR(MAX),

    Training_State BIT DEFAULT 0,

    Created_At DATETIME2 DEFAULT GETDATE()
)
GO

