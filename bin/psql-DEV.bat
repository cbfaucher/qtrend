@echo off

SETLOCAL

IF NOT EXIST ./set_postgresconfig.bat goto error
CALL set_postgresconfig.bat

%POSTGRES_BIN%\psql -U %POSTGRES_USER% -d QTrendDev
goto end

:error
echo ERROR: set_postgresconfig.bat not found

:end
ENDLOCAL
pause