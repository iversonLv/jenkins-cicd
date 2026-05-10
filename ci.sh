#!/bin/bash

set -e

VERSION=$(git rev-parse --short HEAD)

echo "VERSION=$VERSION"

echo "Enable corepack..."
corepack enable

echo "Use packageManager version..."
corepack install

echo "PNPM version:"
pnpm --version

echo "Install dependencies..."
pnpm install --frozen-lockfile

echo "Run coverage..."

if pnpm run coverage:ci; then
    echo "Coverage success"
else
    echo "Coverage failed"

    rm -rf coverage
fi

echo "Build..."
pnpm run build