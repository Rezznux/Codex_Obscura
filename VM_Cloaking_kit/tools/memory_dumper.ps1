
# Memory Dumper for Suspicious Processes (inside FLARE VM)
# Requires: procdump.exe and PE-sieve (place in C:\Tools\Dumpers)

$toolsPath = "C:\Tools\Dumpers"
$dumpOutput = "C:\Dumps"
New-Item -ItemType Directory -Path $dumpOutput -Force | Out-Null

# Dump all suspicious processes (example: rundll32, svchost, powershell)
$suspicious = "rundll32","svchost","powershell","mshta"
foreach ($proc in Get-Process) {
    if ($suspicious -contains $proc.Name) {
        $pid = $proc.Id
        $name = $proc.Name
        Write-Host "[*] Dumping memory for $name (PID $pid)..."
        Start-Process -NoNewWindow -FilePath "$toolsPath\procdump.exe" `
            -ArgumentList "-accepteula -ma $pid $dumpOutput\$name-$pid.dmp"
    }
}

# Run PE-sieve in scan+dump mode (optional)
$pesieve = "$toolsPath\pe-sieve.exe"
if (Test-Path $pesieve) {
    Write-Host "[*] Running PE-sieve in scan+dump mode..."
    Start-Process -NoNewWindow -FilePath $pesieve -ArgumentList "/pid 0 /dir $dumpOutput /minidump"
}
