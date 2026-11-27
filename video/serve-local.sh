#!/usr/bin/env bash
# Serves app/index.html at http://127.0.0.1:8765/ with its chart and spreadsheet
# libraries copied locally, so `explainroo record` works without reaching cdnjs.
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
site="$root/video/build/site"
mkdir -p "$site"
cd "$site"
[ -d node_modules ] || npm i --silent --no-save chart.js@4.4.1 papaparse@5.4.1 xlsx@0.18.5
cp node_modules/chart.js/dist/chart.umd.js chart.js
cp node_modules/papaparse/papaparse.min.js papa.js
cp node_modules/xlsx/dist/xlsx.full.min.js xlsx.js
{
  printf '<!doctype html><html><head><meta charset=utf8><meta name=viewport content="width=device-width,initial-scale=1,viewport-fit=cover"><style>:root{color-scheme:light}body{margin:0;font-size:14px}img{max-width:100%%}[hidden]{display:none!important}</style></head><body>'
  sed -e 's#https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.umd.min.js#chart.js#' \
      -e 's#https://cdnjs.cloudflare.com/ajax/libs/PapaParse/5.4.1/papaparse.min.js#papa.js#' \
      -e 's#https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js#xlsx.js#' \
      "$root/app/index.html"
  echo '</body></html>'
} > index.html
echo "Serving http://127.0.0.1:8765/ (Ctrl+C to stop)"
export NO_PROXY=127.0.0.1,localhost no_proxy=127.0.0.1,localhost
exec python3 -m http.server 8765 --bind 127.0.0.1
