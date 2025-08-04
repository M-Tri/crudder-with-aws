#!/bin/bash
# Load and export all variables from DO_NOT_COMMIT.env into the current shell session

set -a                      # Enable auto-export of variables
source DO_NOT_COMMIT.env    # Load and export variables
set +a                      # Disable auto-export

echo "Environment variables are set up for this session"
