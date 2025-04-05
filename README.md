# Codex Obscura

**Codex Obscura** is an elite malware analysis, reverse engineering, and virtual machine cloaking toolkit that combines operational stealth with automated forensic tooling — built to expose the darkest payloads.

---

##  What is Codex Obscura?

> A cloaked laboratory for decoding stealth malware.

Codex Obscura helps analysts:
- Cloak VMs from anti-analysis malware 
- Dump and reverse memory-resident payloads
- Clean analysis environments of forensic tools
- Automate Ghidra reverse engineering
- Mask digital forensic toolchains using ISO-based stealthing

---

##  Key Features

- **VM Cloaking Scripts** (Windows + Linux host)
- **Anti-Analysis Tool Removal** (inside FLARE VM)
- **Memory Dumper** (Procdump + PE-sieve support)
- **Headless Ghidra Integration** (Windows + Linux)
- **Linux Guest Hardening** (REMnux-style stealth)
- **ISO Stealth Tool Guide** (deploy tools without writing to disk)

---

## 📁 Toolkit Structure

| Folder/File | Purpose |
|-------------|---------|
| `cloak_vm.bat` / `cloak_vm.sh` | VM cloaking on host |
| `cloak_guest.ps1` | Stealth scripting inside Windows VM |
| `tools/` | Scripts for memory dumping, Ghidra, and stealth ops |
| `README.md` | Full usage, licensing, and project scope |

---



##  Usage Docs

> Full usage and step-by-step instructions are embedded inside `README.md` in each section.

---

## License
MIT 

---

Created by [Frontier Labs / Rezznux]
For research only. Handle with caution.

