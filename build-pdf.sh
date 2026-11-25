#!/usr/bin/env bash
# Generate the FR and EN PDFs from index.html with headless Chrome.
# Usage: ./build-pdf.sh   (set CHROME=/path/to/chrome to override the browser)
set -euo pipefail
cd "$(dirname "$0")"

CHROME=${CHROME:-$(command -v google-chrome || command -v chromium || command -v chromium-browser)}

render() { # $1 = lang, $2 = output file
    "$CHROME" --headless=new --disable-gpu --no-pdf-header-footer \
        --print-to-pdf="$2" "file://$PWD/index.html?lang=$1" 2>/dev/null
    echo "$1 -> $2"
}

render fr Mohamed_Mekkaoui_CV_Dev_PHP.pdf
render en Mohamed_Mekkaoui_CV_PHP_Dev_EN.pdf
