#!/bin/bash

APP_NAME="svg2ivg"
OUTPUT_DIR="./build"

PLATFORMS=(
  "linux/amd64"
  "linux/arm64"
  "windows/amd64"
  "darwin/amd64"
  "darwin/arm64"
)

mkdir -p "$OUTPUT_DIR"

for platform in "${PLATFORMS[@]}"
do
    GOOS=${platform%%/*}
    GOARCH=${platform##*/}

    output_name="$APP_NAME-$GOOS-$GOARCH"
    [ "$GOOS" = "windows" ] && output_name+=".exe"

    echo "Building $output_name..."
    env GOOS=$GOOS GOARCH=$GOARCH go build -o "$OUTPUT_DIR/$output_name"
done

echo "✅ All done."
