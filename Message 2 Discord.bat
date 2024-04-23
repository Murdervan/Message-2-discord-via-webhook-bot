@ECHO OFF
REM MADE BY @MURDERVAN - www.unit.link/murdervan/ - www.github.com/murdervan/

ECHO.
ECHO ------------------------------
ECHO Message 2 Discord Via your own bot 
ECHO MADE BY @MURDERVAN
ECHO www.unit.link/murdervan/
ECHO www.github.com/murdervan/
ECHO ------------------------------
ECHO.

REM Webhook URL til Discord
SET "webhookUrl=<DISCORD_WEBHOOK_HERE>"

REM Loop for at indtaste beskeder
:loop
SET /P "userInput=Indtast din besked ('exit' for at afslutte): "

REM Tjek om brugeren vil afslutte
IF "%userInput%"=="exit" (
    GOTO :eof
)

REM Send besked til Discord via webhook
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%userInput%\"}" %webhookUrl%

REM Tjek om beskeden blev sendt korrekt
IF %errorlevel% EQU 0 (
    ECHO Besked sendt til Discord!
) ELSE (
    ECHO Fejl: Besked blev ikke sendt til Discord.
)

REM Gå tilbage til loop for at indtaste flere beskeder
GOTO :loop

:eof
ECHO Scriptet er afsluttet.
PAUSE
