
SELECT COUNT(*) FROM RAW_SPROCESS
SELECT COUNT(*) FROM SPROCESS
SELECT TOP 5*  FROM SPROCESS

SELECT COUNT(*) FROM RAW_R3STATYP
SELECT COUNT(*) FROM R3STATYP
SELECT TOP 5* FROM R3STATYP

SELECT COUNT(*) FROM RAW_R3APPTYP
SELECT COUNT(*) FROM R3APPTYP
SELECT TOP 5* FROM R3APPTYP

SELECT COUNT(*) FROM RAW_SPROCESS_GROUP
SELECT COUNT(*) FROM SPROCESS_GROUP
SELECT top 5* FROM SPROCESS_GROUP

SELECT COUNT(*) FROM RAW_R2CHCKBOX
SELECT COUNT(*) FROM R2CHCKBOX
SELECT top 5* FROM R2CHCKBOX

SELECT *
FROM RAW_R2CHCKBOX
WHERE 
TRY_CAST(REC_DATE AS DATETIME) IS NULL
OR REC_FUL_NAM IS NULL
OR TRY_CAST(R1_DISPLAY_ORDER AS INT) IS NULL;



SELECT DB_NAME()
SELECT name FROM sys.tables

SELECT * 
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'middleware'

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_SCHEMA





1. API Layer
app/api/routes/

This layer receives requests from frontend.

Each file = one group of endpoints.

ai_mapping.py

What it holds:

Bulk AI mapping endpoint
Call RAG service
Return suggestions

Example endpoints:

POST /api/v1/ai/bulk-suggest
POST /api/v1/ai/reindex

Purpose:
Handles AI mapping suggestions

You say:
"Handles bulk AI mapping suggestion endpoints."

feedback.py

What it holds:

Save user feedback
override mapping
store accepted/rejected

Example endpoint:

POST /api/v1/ai/bulk-feedback

Purpose:
Store feedback for AI learning

You say:
"Stores user overrides and feedback for AI training."

workflow.py

What it holds:

Load workflows
load task/status
get mapping screen data

You say:
"Loads workflow task status data."

hours.py

What it holds:

save hours mapping
load hours mapping

You say:
"Handles hours mapping endpoints."

complaints.py

What it holds:

complaint mapping save
load complaint mapping

You say:
"Handles complaint mapping endpoints."

progress.py

What it holds:

mapping completion %
total mapped records

You say:
"Returns mapping progress."

2. Core Layer
app/core/

Core = application level configuration

Shared across project.

config.py

Stores:

DB connection string
API settings
environment variables

Example:

POSTGRES_URL
MSSQL_URL
OPENAI_KEY

You say:
"Central configuration file."

logging.py

Handles:

logs
errors
debug

You say:
"Application logging setup."

constants.py

Stores fixed values

Example:

CONFIDENCE_THRESHOLD = 0.85

You say:
"Project constants."

3. DB Layer
app/db/

Handles database connection.

session.py

Creates DB connection.

Example:

connect postgres
open session
close session

You say:
"Database connection manager."

base.py

Base ORM model.

All tables inherit from this.

Example:

class Base(DeclarativeBase)

You say:
"Base class for all database models."

4. Models
app/db/models/

Defines database tables.

Each file = one table.

staging_workflow.py

Table:

STAGING_WORKFLOW

Stores:

workflow mapping draft
save pending state

staging_hours.py

Table:

STAGING_HOURS

Stores:

hours mapping

staging_complaints.py

Table:

STAGING_COMPLAINTS

Stores:

complaint mapping

feedback.py

Table:

AI_FEEDBACK

Stores:

accepted mapping
overridden mapping
rejected mapping

audit_log.py

Table:

AUDIT_LOG

Stores:

change history
revert support

You say:

"Models define PostgreSQL staging tables."

5. Repositories
app/db/repositories/

Purpose:

Separate SQL logic from services.

Why needed?

Without repo:
services contain SQL

With repo:
SQL centralized

Example:

workflow_repo.py

contains:

insert workflow
update mapping
fetch mapping

You say:

"Repository layer isolates database queries."

6. Schemas
app/schemas/

These are API request/response models

Not DB.

Used for:

validating request
structuring response

Example:

workflow_schema.py

{
 workflow,
 task,
 status
}

ai_schema.py

AI response structure.

feedback_schema.py

feedback request.

You say:

"Schemas define API payload models."

7. Services Layer
app/services/

Business logic.

workflow_service.py

Handles:

load workflows
combine data

revert_service.py

Handles:

Revert to last save

progress_service.py

Calculates:

mapping progress

commit_service.py

Handles:

final commit to Accela

You say:

"Service layer contains business logic."

8. AI Layer
app/ai/

RAG logic.

embeddings.py

Generate embeddings.

vector_search.py

Search Azure AI search.

rag_pipeline.py

Full RAG pipeline.

confidence_engine.py

Calculate confidence.

You say:

"AI RAG suggestion layer."

9. Integrations
app/integrations/

External connections.

azure_search_client.py

Connect Azure AI search.

openai_client.py

Connect OpenAI.

accela_client.py

Connect Accela DB/API.

postgres_client.py

Connect PostgreSQL.

You say:

"External system connectors."

10. main.py

Entry point.

Starts:

FastAPI
DB connection
routes

You say:

"Application entry point."

Final Summary (Say in call)

API layer → endpoints
Service layer → business logic
DB layer → PostgreSQL staging
Models → tables
Repositories → SQL queries
Schemas → API payloads
AI layer → RAG logic
Integrations → external systems
Core → config & logging
main.py → entry point

This explanation is perfect.










