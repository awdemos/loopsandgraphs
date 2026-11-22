#!/usr/bin/env bash
set -euo pipefail

# Copy deployable assets into the Workers Assets directory.
cp index.html public/index.html
cp og-image.png public/og-image.png

npx wrangler deploy
