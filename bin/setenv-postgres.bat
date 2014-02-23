@echo off

IF NOT EXIST ./set_postgresconfig.bat goto error
CALL set_postgresconfig.bat
goto end

:error
echo ERROR: set_postgresonfig.bat not found!

:end
