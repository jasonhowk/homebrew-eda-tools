#!/bin/bash
set -euo pipefail

if ! command -v brew &>/dev/null; then
  echo "Homebrew is required. Install it first: https://brew.sh"
  exit 1
fi

TMP_BREWFILE=$(mktemp)
trap 'rm -f "$TMP_BREWFILE"' EXIT
curl -fsSL https://raw.githubusercontent.com/jasonhowk/homebrew-eda-tools/main/Brewfile -o "$TMP_BREWFILE"
brew bundle --file="$TMP_BREWFILE"
