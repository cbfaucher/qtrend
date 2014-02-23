@echo off

SETLOCAL

IF NOT EXIST ./set_postgresconfig.bat goto error
CALL set_postgresconfig.bat

%POSTGRES_BIN%\dropdb -U %POSTGRES_USER% QTrend
%POSTGRES_BIN%\createdb -U %POSTGRES_USER% QTrend

%POSTGRES_BIN%\psql -U %POSTGRES_USER% -d QTrend -f ..\sql\init-qtrend-db.sql
goto end

:error
echo ERROR: set_postgresconfig.bat not found

:end
ENDLOCAL
