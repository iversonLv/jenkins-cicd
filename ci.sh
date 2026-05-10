#!/bin/bash

set -e

VERSION=$(git rev-parse --short HEAD)

echo "VERSION=$VERSION"

echo "PNPM version:"
pnpm --version

echo "Install dependencies..."
pnpm install --frozen-lockfile

echo "Run coverage..."

if pnpm run coverage:ci; then
    zip -r artifact/coverage-${VERSION}.zip coverage
    echo "Coverage success"
else
    echo "Coverage failed"

    rm -rf coverage
fi

echo "Build..."
pnpm run build

echo "Zip build"
zip -r artifact/dist-${VERSION}.zip dist

echo "Success..."