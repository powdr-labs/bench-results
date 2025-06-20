#!/bin/bash

# Sets up a virtual environment for running the python scripts.
# It will create a .venv directory in the script's directory.
# The script outputs the source command to activate the virtual environment:
# `venv.sh` or $(venv.sh) will setup and activate in a single command.

# get the directory of this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="$SCRIPT_DIR/.venv"

# Check if the virtual environment directory exists
if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv "$VENV_DIR" || {
        echo "Failed to create virtual environment. Ensure Python 3 and venv module are installed." >&2
        exit 1
    }
fi
source "$VENV_DIR/bin/activate"
# Install requirements if requirements.txt exists
if [ -f "$SCRIPT_DIR/requirements.txt" ]; then
    pip install -r "$SCRIPT_DIR/requirements.txt" >&2 || {
        echo "Failed to install requirements.txt" >&2
        exit 1
    }
fi

echo source "$VENV_DIR/bin/activate"
