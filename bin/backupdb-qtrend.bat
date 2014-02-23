@echo off

SETLOCAL

IF NOT EXIST ./set_postgresconfig.bat goto error
CALL set_postgresconfig.bat

%POSTGRES_BIN%\pg_dump.exe -i -h %POSTGRES_HOST% -p 5432 -U %POSTGRES_USER% -F p -C -v -f "..\sql\my-backup-qtrend.sql" "QTrend"
goto end

:error
echo ERROR: set_postgresconfig.bat not found

:end
ENDLOCAL