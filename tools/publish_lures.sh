#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if ! command -v git >/dev/null 2>&1; then
  echo "git not found" >&2
  exit 1
fi

echo "Staging TsuYoki Lures 2014-2026 (this can take a long time if iCloud is evicting files)..."
git add "TsuYoki Lures 2014-2026"

echo "Done staging. Next:"
echo "  git commit -m \"Add lure images\""
echo "  git push"
