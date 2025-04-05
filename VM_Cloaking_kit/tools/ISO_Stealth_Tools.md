
## 🔐 ISO Builder for Stealth Tool Deployment

To securely use malware analysis tools **without leaving a trace** in the VM:

### 🧰 How to Build a Tool ISO (Windows):
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

### ✅ Benefits:
- Tools aren’t visible to malware by default
- Nothing written to disk unless you extract
- Easy to update and re-burn ISO
