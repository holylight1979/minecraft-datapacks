param(
    [switch]$Watch
)

$MinecraftDir = "C:\Users\holyl\AppData\Roaming\.minecraft"
$CentralDir   = Join-Path $MinecraftDir "my_datapacks"
$SavesDir     = Join-Path $MinecraftDir "saves"

function Sync-WorldDatapacks {
    param([string]$WorldPath)
    if (-not (Test-Path $WorldPath -PathType Container)) { return }
    $WorldName = Split-Path $WorldPath -Leaf
    if ($WorldName.StartsWith(".")) { return }

    $WorldDpDir = Join-Path $WorldPath "datapacks"
    if (-not (Test-Path $WorldDpDir)) {
        New-Item -ItemType Directory -Path $WorldDpDir -Force | Out-Null
    }

    # Find all datapack directories in my_datapacks (any folder containing pack.mcmeta)
    $Packs = Get-ChildItem -Path $CentralDir -Directory -ErrorAction SilentlyContinue | Where-Object {
        Test-Path (Join-Path $_.FullName "pack.mcmeta")
    }

    foreach ($Pack in $Packs) {
        $TargetLink = Join-Path $WorldDpDir $Pack.Name
        if (-not (Test-Path $TargetLink)) {
            cmd.exe /c mklink /J "$TargetLink" "$($Pack.FullName)" | Out-Null
            Write-Host "[AutoSync] 已掛載資料包 '$($Pack.Name)' -> 世界 '$WorldName'" -ForegroundColor Green
        }
    }
}

function Sync-AllWorlds {
    if (-not (Test-Path $SavesDir)) { return }
    Get-ChildItem -Path $SavesDir -Directory -ErrorAction SilentlyContinue | ForEach-Object {
        Sync-WorldDatapacks -WorldPath $_.FullName
    }
}

# Run initial sync across all existing worlds
Sync-AllWorlds

if ($Watch) {
    Write-Host "[AutoSync] 正在背景監控 '$SavesDir' 與 '$CentralDir'..." -ForegroundColor Cyan
    $Watcher = New-Object System.IO.FileSystemWatcher
    $Watcher.Path = $SavesDir
    $Watcher.IncludeSubdirectories = $false
    $Watcher.EnableRaisingEvents = $true

    while ($true) {
        Start-Sleep -Seconds 2
        Sync-AllWorlds
    }
}
