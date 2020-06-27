#!/usr/bin/env bash
set -euo pipefail

# Get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "> Run macOS shell scripts..."

echo ">>> Run system config script"
"${DIR}/system.sh"

echo ">>> Run dock config script"
"${DIR}/dock.sh"

echo ">>> Run finder config script"
"${DIR}/finder.sh"

echo ">>> Run safari config script"
"${DIR}/safari.sh"

echo ">>> Run vscode config script"
"${DIR}/vscode.sh"

echo ">>> Run xcode config script"
"${DIR}/xcode.sh"

echo ">>> Run misc config script"
"${DIR}/misc.sh"
