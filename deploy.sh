#!/usr/bin/env bash
set -euo pipefail

# Ensure pinned dependencies are installed before deploying.
if [ ! -d "node_modules" ]; then
  npm ci
fi

# Copy deployable assets into the Workers Assets directory.
cp index.html public/index.html
cp og-image.png public/og-image.png

npx wrangler deploy
