@echo off

if not exist .\build mkdir .\build

set INCLUDE_DIRS=/I..\third_party\glfw\include /I..\third_party\glad\include
set LIB_DIRS=/LIBPATH:..\third_party\glfw\lib-vc2022
set LIBS=glfw3_mt.lib opengl32.lib user32.lib gdi32.lib shell32.lib

pushd .\build
cl -Zi -FC /MT %INCLUDE_DIRS% ..\src\main.c ..\third_party\glad\src\glad.c /link %LIB_DIRS% %LIBS%
set BUILD_ERROR=%ERRORLEVEL%
popd
exit /b %BUILD_ERROR%
