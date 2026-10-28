@echo off
chcp 65001 >nul
echo ========================================================
echo   Minecraft Datapacks - Auto Link to All Worlds
echo ========================================================
echo.
for /d %%W in ("%APPDATA%\.minecraft\saves\*") do (
    if not exist "%%~fW\datapacks" mkdir "%%~fW\datapacks"
    for /d %%P in ("%APPDATA%\.minecraft\my_datapacks\*") do (
        if exist "%%~fP\pack.mcmeta" (
            if not exist "%%~fW\datapacks\%%~nxP" (
                echo [NEW LINK] World [%%~nxW] ^<== Datapack [%%~nxP]
                mklink /J "%%~fW\datapacks\%%~nxP" "%%~fP" >nul
            ) else (
                echo [LINKED]   World [%%~nxW] --- Datapack [%%~nxP]
            )
        )
    )
)
echo.
echo All worlds synced successfully!
