#!/bin/bash

set -e

echo "Enable corepack..."
corepack enable
corepack prepare pnpm@latest --activate

echo "Install dependencies..."
pnpm install --frozen-lockfile

echo "Run tests..."
pnpm run test:coverage

echo "Build..."
pnpm run build

echo "Done!"