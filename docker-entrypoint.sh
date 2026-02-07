#!/bin/sh
set -e

# Default SERVER_MODE=true
SERVER_MODE="${SERVER_MODE:-true}"

# 1️⃣ If a command is provided, ALWAYS run it
if [ "$#" -gt 0 ]; then
  exec "$@"
fi

# 2️⃣ No command provided → decide based on SERVER_MODE
if [ "$SERVER_MODE" = "true" ]; then
  echo "[data-analysis-stack] SERVER_MODE=true → running as long-lived container"
  exec sleep infinity
fi

# 3️⃣ Fallback to shell
exec bash
