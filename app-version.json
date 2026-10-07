#!/bin/bash
# pi-app-store: 1
set -eu
cd -- "$(dirname -- "$0")"
case "${1:-}" in
  install) command -v python3 >/dev/null
    test -f 1-index.html
    test -f 2-go.html
    mkdir -p .app-store-site
    cp 1-index.html .app-store-site/index.html
    cp 2-go.html .app-store-site/go.html
    cp 3-logo.png .app-store-site/logo.png
    cp 4-favicon.png .app-store-site/favicon.png
    cp 5-apple-touch-icon.png .app-store-site/apple-touch-icon.png ;;
  run) echo "Local preview: http://127.0.0.1:8081 (Ctrl+C stops). No service or tunnel installed."
    exec python3 -m http.server 8081 --bind 127.0.0.1 --directory .app-store-site ;;
  *) echo "Use: bash app-store.sh install OR bash app-store.sh run"; exit 1 ;;
esac
