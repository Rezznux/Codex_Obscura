
# Ghidra Headless Auto-Importer (Windows PowerShell)
# Usage: .\ghidra_auto_import.ps1 -BinaryPath "C:\path\to\file.exe" -GhidraPath "C:\Ghidra" -ProjectDir "C:\GhidraProjects"

param (
    [string]$BinaryPath,
    [string]$GhidraPath = "C:\Ghidra",
    [string]$ProjectDir = "C:\GhidraProjects\Almanox",
    [string]$ProjectName = "AlmanoxAnalysis"
)

if (!(Test-Path $BinaryPath)) {
    Write-Error "Binary path not found: $BinaryPath"
    exit 1
}

$analyzePath = Join-Path $GhidraPath "support\analyzeHeadless.bat"

& $analyzePath $ProjectDir $ProjectName -import $BinaryPath -overwrite -scriptPath "$GhidraPath\Ghidra\Features\Base\ghidra_scripts" -postScript "AutoAnalysisScript.java"
