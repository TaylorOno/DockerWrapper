@echo off

IF [%1]==[/?] GOTO :help

IF [%1]==[/r] GOTO :removeImage

echo %* |find "/?" > nul
IF errorlevel 1 GOTO :main

:help
ECHO Usage: %0 [option...]
ECHO Usage: %0 [parm 1] [parm 2]
ECHO Example %0 parm1 parm2
ECHO Tool Description
ECHO
ECHO    /r                      This will refresh {docker-image} docker image
ECHO                            (Only needed if the {docker-image} Version has changed
ECHO
GOTO :end

:removeImage
docker image rm -f {docker-image}
SET REFRESH="1"

:checkBase
FOR /F %%i IN ('docker images -q {docker-image}') DO (
    ECHO Found {docker-image} image
    GOTO :main
)
docker build -t {docker-image}:latest -f ./docker/Dockerfile .
ECHO %REFRESH%
IF [%REFRESH%] == ["1"] GOTO :end

:main
docker run --rm -it ^
-v "%1:{mount-directory}" ^
{docker-image} ^
{docker-cmd}

:end