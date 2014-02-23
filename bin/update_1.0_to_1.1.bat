@echo off

SETLOCAL

IF NOT EXIST ./set_postgresconfig.bat goto error
CALL set_postgresconfig.bat

%POSTGRES_BIN%\psql -U %POSTGRES_USER% -d QTrend -f ..\sql\update_1.0_to_1.1.sql
goto end

:error
echo ERROR: set_postgresconfig.bat not found

:end
ENDLOCAL
pause