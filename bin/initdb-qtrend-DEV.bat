@echo off

SETLOCAL

IF NOT EXIST ./set_postgresconfig.bat goto error
CALL set_postgresconfig.bat

%POSTGRES_BIN%\dropdb -U %POSTGRES_USER% QTrendDev
%POSTGRES_BIN%\createdb -U %POSTGRES_USER% QTrendDev

%POSTGRES_BIN%\psql -U %POSTGRES_USER% -d QTrendDev -f ..\sql\init-qtrend-db.sql
goto end

:error
echo ERROR: set_postgresconfig.bat not found

:end
ENDLOCAL
