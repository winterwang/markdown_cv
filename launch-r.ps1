# Launch R in the current VS Code workspace folder
# Usage: Run this script from VS Code integrated terminal
# It will start the R GUI/terminal with working directory set to the folder containing this script.

$rootPath = "C:\Users\GQAEC\OneDrive - Bayer\Rprojects"    # explicit root containing bracket characters
if (-Not (Test-Path -LiteralPath $rootPath)) {
    Write-Error "Root path not found: $rootPath"; exit 1
}

# The project folder (this script's directory)
$workspace = $PSScriptRoot
if (-Not (Test-Path -LiteralPath $workspace)) {
    Write-Error "Workspace path not found: $workspace"; exit 1
}

Write-Host "Root    : $rootPath"
Write-Host "Project : $workspace"
Write-Host "Starting R with working directory set to project folder..."
Push-Location -LiteralPath $workspace
# Path to R executable (adjust if version changes)
# $RExe = "C:\Users\GQAEC\AppData\Local\Programs\R\R\bin\R.exe"
$RExe = "C:\Users\GQAEC\AppData\Local\Programs\R\R-4.5.2\bin\R.exe"
if (-Not (Test-Path $RExe)) {
    Write-Error "R executable not found at $RExe. Update path in launch-r.ps1."
    exit 1
}
& $RExe --no-save --no-restore
Pop-Location
