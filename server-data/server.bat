@echo off
color 0c
echo -
echo [youtube.com/c/IgorWinchester] Deletando cache ...
echo -
rd /s /q "cache"
timeout 2
test&cls
color 0c  
start ../build/FXServer.exe +exec server.cfg +set onesync_enableInfinity 1 +set onesync on +set sv_enforceGameBuild 2189