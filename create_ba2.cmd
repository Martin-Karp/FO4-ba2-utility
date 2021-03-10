@ECHO Off
CLS
ECHO:..........................................................................
ECHO::                                                                        :
ECHO:: Builds a Fallout 4 .ba2 archive from the loose files of a folder       :
ECHO:: syntax : Archive2 ^<archive, files^/folders^> [^<arguments^>]               :
ECHO::........................................................................:                                                                       

SET dir=%~dp0
SET Archive2=D:\Program Files (x86)\Steam\steamapps\common\Fallout 4\Tools\Archive2\

CD /D "%dir%"

ECHO:
ECHO current directory : %dir%
ECHO Archive2.exe path : %Archive2%

IF NOT EXIST "%Archive2%Archive2.exe" (
    GOTO :noexe
)

:name
REM Sets archives names based on first plugin found
SET filename=""
for /R "%dir%" %%G in (*.esp *.esl *.esm) DO (
    IF EXIST %%G (
        SET filename=%%~nG
        GOTO :process
    )
)
GOTO :abort

:process
REM Textures.ba2
IF EXIST "%dir%textures" (
    ECHO:
    ECHO textures folder found
    ECHO:
    CALL :textures
) ELSE (
    ECHO:
    ECHO textures folder not found.
)
REM Main.ba2
REM folders for Main archive : interface,materials,meshes,scripts,sound,strings
SET lookfor=interface,materials,meshes,scripts,sound,strings
SET folders=
FOR %%G IN (%lookfor%) DO (
    IF EXIST "%dir%%%G" (
        CALL :addfolder %%G
    )
)
IF "%folders%"=="" (
    ECHO:
    ECHO %lookfor% folders not found.
) ELSE (
    ECHO:
    ECHO found: %folders% folders
    ECHO:
    CALL :main
)
REM End
ECHO:
PAUSE
GOTO :eof


:abort
ECHO:
ECHO no plugin found
PAUSE
EXIT /B 0

:noexe
ECHO:
ECHO Please set the directory path of the Archive2.exe tool from Creation Kit in this .cmd file (line 10)
ECHO with trailing backslash and without quotes.
ECHO Usually: C:\Program Files (x86)\Steam\steamapps\common\Fallout 4\Tools\Archive2\
ECHO:
PAUSE
EXIT /B 0

:addfolder
IF "%folders%"=="" (
    SET folders=%1
) ELSE (
    SET folders=%folders%,%1
)
GOTO :eof

:textures
REM  Archive2 does not tolerate trailing backslash with arguments
CALL "%Archive2%Archive2.exe" textures -c="%filename% - Textures.ba2" -r="%dir:~0,-1%" -f=DDS
REM Deletes the textures folder
RMDIR /S /Q "%dir%textures"
GOTO :eof

:main
CALL "%Archive2%Archive2.exe" %folders% -c="%filename% - Main.ba2" -r="%dir:~0,-1%" -f=General 
REM Deletes the folders in %folders%
FOR %%G IN (%folders%) DO (RMDIR /S /Q "%dir%%%G")
GOTO :eof