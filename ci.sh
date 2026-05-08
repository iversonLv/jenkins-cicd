#!/bin/bash

set -e
corepack enable
echo "Install pnpm..."
npm install -g pnpm

echo "Install dependencies..."
pnpm install --frozen-lockfile

echo "Run tests..."
pnpm run test:coverage

echo "Build..."
pnpm run build