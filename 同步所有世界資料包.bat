@echo off
chcp 65001 >nul
echo ========================================================
echo   Minecraft 自訂資料包 — 自動掛載至所有世界存檔
echo ========================================================
echo.
for /d %%W in ("%APPDATA%\.minecraft\saves\*") do (
    if not exist "%%W\datapacks" mkdir "%%W\datapacks"
    for /d %%P in ("%APPDATA%\.minecraft\my_datapacks\*") do (
        if exist "%%P\pack.mcmeta" (
            if not exist "%%W\datapacks\%%~nxP" (
                echo [新增掛載] 世界「%%~nxW」 ^<== 資料包「%%~nxP」
                mklink /J "%%W\datapacks\%%~nxP" "%%P" >nul
            ) else (
                echo [已掛載]   世界「%%~nxW」 --- 資料包「%%~nxP」
            )
        )
    )
)
echo.
echo 全部世界同步完成！
