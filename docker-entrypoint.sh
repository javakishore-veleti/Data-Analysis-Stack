#!/bin/sh
set -e

# Default SERVER_MODE=true
SERVER_MODE="${SERVER_MODE:-true}"

if [ "$SERVER_MODE" = "true" ]; then
  echo "[data-analysis-stack] SERVER_MODE=true → running as long-lived container"
  exec sleep infinity
fi

# If a command is provided, run it
if [ "$#" -gt 0 ]; then
  exec "$@"
fi

# Default fallback
exec bash
