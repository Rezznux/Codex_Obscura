
#!/bin/bash
# Headless Ghidra script to auto-import and analyze a binary

# Change these paths as needed
GHIDRA_PATH="/opt/ghidra"
PROJECT_DIR="$HOME/ghidra_projects/Almanox"
BIN_PATH="$1"
PROJECT_NAME="AlmanoxAnalysis"

if [ ! -f "$BIN_PATH" ]; then
  echo "Usage: $0 path_to_binary"
  exit 1
fi

"$GHIDRA_PATH/support/analyzeHeadless" "$PROJECT_DIR" "$PROJECT_NAME" -import "$BIN_PATH" -overwrite -scriptPath "$GHIDRA_PATH/Ghidra/Features/Base/ghidra_scripts" -postScript "AutoAnalysisScript.java"
