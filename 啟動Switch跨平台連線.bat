@echo off
chcp 65001 >nul
title 啟動Switch跨平台連線
rem 1) Geyser: start only if UDP 19132 is not already in use
netstat -ano -p UDP | findstr /C:":19132 " >nul
if errorlevel 1 (
  echo 正在啟動 Geyser...
  start "" "%APPDATA%\.minecraft\multiplayer-bridge\start-geyser.cmd"
) else (
  echo Geyser 已在執行，略過。
)
rem 2) Minecraft Launcher
start "" explorer.exe "shell:AppsFolder\Microsoft.4297127D64EC6_8wekyb3d8bbwe!Minecraft"
rem Use profile fabric-loader-26.3; worlds auto-open to LAN 25565 (offline) via auto-lan-switch mod
timeout /t 2 /nobreak >nul
exit