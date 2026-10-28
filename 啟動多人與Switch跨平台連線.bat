@echo off
chcp 65001 >nul
title Minecraft 多人與 Switch (Bedrock) 跨平台連線啟動器
echo ========================================================
echo   Minecraft 26.3 多人連線 ^& Switch 跨平台啟動器
echo ========================================================
echo.
call "%APPDATA%\.minecraft\my_datapacks\同步所有世界資料包.bat"
echo.
echo [1/2] 正在啟動 Geyser Standalone (Switch / 基岩版橋接器, UDP 19132 -^> TCP 25565)...
start "GeyserMC Crossplay Bridge" /D "%APPDATA%\.minecraft\multiplayer-bridge" "C:\Users\holyl\AppData\Local\Packages\Microsoft.4297127D64EC6_8wekyb3d8bbwe\LocalCache\Local\runtime\java-runtime-epsilon\windows-x64\java-runtime-epsilon\bin\java.exe" -Xms512M -Xmx1024M -jar "%APPDATA%\.minecraft\multiplayer-bridge\Geyser-Standalone.jar" --nogui
echo [2/2] 正在啟動 playit.gg 外網連線隧道...
start "playit.gg Tunnel" "C:\Users\holyl\AppData\Local\Microsoft\WinGet\Packages\DevelopedMethods.playit_Microsoft.Winget.Source_8wekyb3d8bbwe\playit.exe"
echo.
echo 已啟動！請在 Minecraft 單人世界中輸入： /publish true 25565
pause
