@echo off
chcp 65001 >nul
title Minecraft 26.3 多人外網與 Switch 跨平台連線啟動器

echo ================================================================
echo   Minecraft 26.3 多人外網 (playit.gg) + Switch 跨平台 (Geyser)
echo ================================================================
echo.
echo [步驟 1] 請確認您已在 Minecraft 進入世界，並執行：
echo          按 ESC -^> 對區域網路開放 (Open to LAN) -^> 連接埠設為 25565
echo          (或在遊戲內直接輸入指令： /publish true 25565 )
echo.
echo [步驟 2] 正在同步所有世界的自訂資料包連結 (my_datapacks)...
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Users\holyl\AppData\Roaming\.minecraft\my_datapacks\sync-worlds.ps1"
echo.
echo [步驟 3] 正在啟動 playit.gg 外網穿透視窗...
start "playit.gg 外網連線通道" "C:\Users\holyl\AppData\Local\Microsoft\WinGet\Packages\DevelopedMethods.playit_Microsoft.Winget.Source_8wekyb3d8bbwe\playit.exe"
echo.
echo [步驟 4] 正在啟動 Geyser Standalone (Switch / 基岩版轉譯橋接器, Port 19132)...
cd /d "C:\Users\holyl\AppData\Roaming\.minecraft\multiplayer-bridge"
"C:\Users\holyl\AppData\Local\Packages\Microsoft.4297127D64EC6_8wekyb3d8bbwe\LocalCache\Local\runtime\java-runtime-epsilon\windows-x64\java-runtime-epsilon\bin\java.exe" -Xms1024M -Xmx1024M -jar Geyser-Standalone.jar --nogui
pause
