@echo off

SETLOCAL

IF NOT EXIST ./set_javahome.bat goto error
CALL ./set_javahome.bat

ECHO JAVA_HOME=%JAVA_HOME%

set CLASSPATH=.
set CLASSPATH=%CLASSPATH%;..\lib\QUtilities.jar
set CLASSPATH=%CLASSPATH%;..\lib\QTrend.jar
set CLASSPATH=%CLASSPATH%;..\lib\mail.jar
set CLASSPATH=%CLASSPATH%;..\lib\activation.jar
set CLASSPATH=%CLASSPATH%;..\lib\log4j-1.2.11.jar
set CLASSPATH=%CLASSPATH%;..\lib\commons-beanutils-core.jar
set CLASSPATH=%CLASSPATH%;..\lib\commons-beanutils.jar
set CLASSPATH=%CLASSPATH%;..\lib\commons-collections.jar
set CLASSPATH=%CLASSPATH%;..\lib\commons-lang-2.0.jar
set CLASSPATH=%CLASSPATH%;..\lib\commons-logging-1.0.4.jar
set CLASSPATH=%CLASSPATH%;..\lib\commons-dbcp-1.2.1.jar
set CLASSPATH=%CLASSPATH%;..\lib\commons-pool-1.3.jar
set CLASSPATH=%CLASSPATH%;..\lib\postgresql-8.1-404.jdbc2.jar
REM set CLASSPATH=%CLASSPATH%;..\lib\spring-core.jar
REM set CLASSPATH=%CLASSPATH%;..\lib\spring-context.jar
REM set CLASSPATH=%CLASSPATH%;..\lib\spring-beans.jar
REM set CLASSPATH=%CLASSPATH%;..\lib\spring-dao.jar
REM set CLASSPATH=%CLASSPATH%;..\lib\spring-jdbc.jar
set CLASSPATH=%CLASSPATH%;..\lib\spring.jar
REM set CLASSPATH=%CLASSPATH%;..\lib\jcommon-1.0.0.jar
REM set CLASSPATH=%CLASSPATH%;..\lib\jfreechart-1.0.1.jar
set CLASSPATH=%CLASSPATH%;..\lib\commons-digester-1.8.jar
set CLASSPATH=%CLASSPATH%;..\lib\joda-time-1.4.jar
set CLASSPATH=%CLASSPATH%;..\config

"%JAVA_HOME%\bin\java" -classpath %CLASSPATH% com.quartz.qtrend.tasks.updates.Main
goto end

:error
echo ERROR: set_javahome.bat not found!

:end
ENDLOCAL