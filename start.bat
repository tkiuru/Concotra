@echo off

set CLASSPATH=lib;webapp\WEB-INF\lib\scala-library.jar;lib\jetty-6.1.22.jar;lib\jetty-util-6.1.22.jar
set CLASSPATH=%CLASSPATH%;lib\servlet-api-2.5-20081211.jar;webapp\WEB-INF\lib\paranamer-2.0.jar;webapp\WEB-INF\lib\httpclient-4.0.1.jar
set CLASSPATH=%CLASSPATH%;webapp\WEB-INF\lib\dispatch-http_2.8.0-0.7.6.ja;webapp\WEB-INF\lib\commons-logging-1.1.1.jar;webapp\WEB-INF\lib\httpcore-4.0.1.jar
set CLASSPATH=%CLASSPATH%;webapp\WEB-INF\lib\lift-json_2.8.0-2.1-M1.jar;webapp\WEB-INF\lib\scalatra_2.8.0-2.0.0-SNAPSHOT.jar;webapp\WEB-INF\lib\dispatch-http-json_2.8.0-0.7.6.jar
set CLASSPATH=%CLASSPATH%;webapp\WEB-INF\lib\dispatch-json_2.8.0-0.7.6.jar;webapp\WEB-INF\lib\commons-codec-1.3.jar;webapp\WEB-INF\lib\dispatch-futures_2.8.0-0.7.6.jar
set CLASSPATH=%CLASSPATH%;webapp\WEB-INF\lib\joda-time-1.6.1.jar

java -cp %CLASSPATH% concotra.Main

