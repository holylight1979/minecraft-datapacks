@echo off
chcp 65001 >nul
title Minecraft Multiplayer ^& Switch Crossplay Launcher
echo ========================================================
echo   Minecraft 26.3 Multiplayer ^& Switch Crossplay Launcher
echo ========================================================
echo.
call "%APPDATA%\.minecraft\my_datapacks\同步所有世界資料包.bat"
echo.
echo [1/2] Starting Geyser Standalone (Switch / Bedrock Bridge, UDP 19132 -^> TCP 25565)...
start "GeyserMC Crossplay Bridge" /D "%APPDATA%\.minecraft\multiplayer-bridge" "C:\Users\holyl\AppData\Local\Packages\Microsoft.4297127D64EC6_8wekyb3d8bbwe\LocalCache\Local\runtime\java-runtime-epsilon\windows-x64\java-runtime-epsilon\bin\java.exe" -Xms512M -Xmx1024M -jar "%APPDATA%\.minecraft\multiplayer-bridge\Geyser-Standalone.jar" --nogui
echo [2/2] Starting playit.gg Tunnel...
start "playit.gg Tunnel" "C:\Users\holyl\AppData\Local\Microsoft\WinGet\Packages\DevelopedMethods.playit_Microsoft.Winget.Source_8wekyb3d8bbwe\playit.exe"
echo.
echo Ready! In your Minecraft singleplayer world, run: /publish true 25565
pause
