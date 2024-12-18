#!/bin/sh
# Build the website by compiling the channel page of the sc4pac-tools repository (usually a submodule)
# and add all files from ./docs/ folder as well.
# (The channel JSON files need to be built separately and may already exist in "$OUT/channel/".)
set -e
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <sc4pac-tools-dir> <docs-dir> <website-output-dir>"
    exit 1
fi

SC4PAC_TOOLS_DIR="$1"
DOCS_DIR="$2"
OUT="$3"

(cd "$SC4PAC_TOOLS_DIR" && ./src/scripts/build-channel-page.sh)

cp -p "$SC4PAC_TOOLS_DIR/web/target/website/channel"/* "$OUT/channel/"
cp -pr "$DOCS_DIR"/* "$OUT"
