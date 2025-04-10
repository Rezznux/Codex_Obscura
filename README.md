# Codex Obscura

**Codex Obscura** is an elite malware analysis, reverse engineering, and virtual machine cloaking toolkit that combines operational stealth with automated forensic tooling — built to expose the darkest payloads.

---

##  Features Overview

| Feature                      | Description |
|-----------------------------|-------------|
| **VM Cloaking (Windows/Linux)** | Hides VirtualBox artifacts, spoofs hardware |
| **Anti-Analysis Tool Removal** | Deletes or hides reverse engineering tools |
| **Memory Dumper**           | Dumps in-memory payloads from suspicious processes |
| **Ghidra Integration**      | Headless automation for importing and analyzing binaries |
| **Linux Hardening Script**  | Fakes user activity and removes forensic tools |
| **Stealth ISO Builder Guide** | Protects analysis tools using read-only mounted ISOs |

---

##  File Overview

| File | Purpose |
|------|---------|
| `cloak_vm.bat` | Cloak VirtualBox VM (Windows host) |
| `cloak_vm.sh`  | Cloak VirtualBox VM (Linux/macOS host) |
| `cloak_guest.ps1` | Run inside FLARE VM to fake user activity and disable networking |
| `tools/scrub_analysis_tools.ps1` | Removes known malware analysis tools inside the VM |
| `tools/memory_dumper.ps1` | Dumps memory of suspicious processes, runs PE-sieve |
| `tools/ghidra_auto_import.sh` | Ghidra headless import (Linux) |
| `tools/ghidra_auto_import.ps1` | Ghidra headless import (Windows) |
| `tools/cloak_linux_vm.sh` | Harden a Linux (REMnux) VM against evasion detection |
| `tools/ISO_Stealth_Tools.md` | Guide for ISO-based stealth tool deployment |

---

##  Usage Instructions

### 1. Cloak the VirtualBox VM (Host)
#### Windows:
```cmd
cloak_vm.bat
```

#### Linux/macOS:
```bash
chmod +x cloak_vm.sh
./cloak_vm.sh
```

---

### 2. Harden the Guest OS (Inside the VM)
```powershell
powershell -ExecutionPolicy Bypass -File cloak_guest.ps1
```

---

### 3. Remove Known Reverse Engineering Tools
```powershell
powershell -ExecutionPolicy Bypass -File tools/scrub_analysis_tools.ps1
```

---

### 4. Dump Memory of Live Payloads
1. Place `procdump.exe` and `pe-sieve.exe` in:
```
   C:\Tools\Dumpers
   ```

2. Run the memory dumper:
```powershell
powershell -ExecutionPolicy Bypass -File tools/memory_dumper.ps1
```

Dumps are saved to `C:\Dumps`.

---

### 5. Analyze with Ghidra (Headless)
#### On Linux:
```bash
./tools/ghidra_auto_import.sh path/to/binary
```

#### On Windows:
```powershell
.	ools/ghidra_auto_import.ps1 `
  -BinaryPath "C:\Dumps\payload.exe" `
  -GhidraPath "C:\Ghidra" `
  -ProjectDir "C:\GhidraProjects"
```

---

### 6. Harden Linux VMs (REMnux)
```bash
chmod +x tools/cloak_linux_vm.sh
./tools/cloak_linux_vm.sh
```

---

### 7. Use ISO for Tool Stealthing
See `tools/ISO_Stealth_Tools.md` for step-by-step instructions on how to:
- Package your tools into an ISO
- Mount temporarily inside FLARE VM
- Avoid detection by malware

---

To securely use malware analysis tools **without leaving a trace** in the VM:

1. Collect your tools (e.g., x64dbg, IDA, Procmon) into a folder:
   ```
   tools_iso/
     ├── ida64.exe
     ├── x64dbg/
     ├── procexp.exe
   ```

2. Use any ISO maker (e.g., [InfraRecorder](http://infrarecorder.org/), [ImgBurn], or PowerISO)

3. Mount the ISO inside your FLARE VM:
   - In VirtualBox: Settings → Storage → Add optical drive → Choose ISO

4. Access tools temporarily and unmount when done

###  Benefits:
- Tools aren’t visible to malware by default
- Nothing written to disk unless you extract
- Easy to update and re-burn ISO

---



##  Safety Notes

- Always run in an **isolated VM with snapshots**
- Disable **clipboard sharing**, **drag & drop**, and **shared folders**
- Avoid analyzing live samples on your host machine

---



