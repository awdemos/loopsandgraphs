#!/usr/bin/env bash
set -euo pipefail

cp index.html public/index.html
wrangler deploy
