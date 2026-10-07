

IF DB_ID('university_etl') IS NULL
    CREATE DATABASE university_etl;
GO

USE university_etl;
GO

IF OBJECT_ID('pipeline_logs', 'U') IS NULL
BEGIN
    CREATE TABLE pipeline_logs (
        id INT IDENTITY(1,1) PRIMARY KEY,
        task_name VARCHAR(100),
        status VARCHAR(30),
        execution_time DATETIME DEFAULT GETDATE()
    );
END;
GO


INSERT INTO pipeline_logs (task_name, status)
VALUES ('start_pipeline', 'STARTED');


INSERT INTO pipeline_logs (task_name, status)
VALUES ('run_extraction_script', 'COMPLETED');


INSERT INTO pipeline_logs (task_name, status)
VALUES ('log_pipeline_success', 'SUCCESS');


SELECT * FROM pipeline_logs;