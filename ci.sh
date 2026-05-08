#!/bin/bash

set -e

echo "Install dependencies..."
npx pnpm install --frozen-lockfile

echo "Run tests..."
npx pnpm run coverage:ci

echo "Build..."
npx pnpm run build