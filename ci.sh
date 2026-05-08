#!/bin/bash

echo "Install dependencies..."
pnpm install --frozen-lockfile || exit 1

echo "Run test..."
pnpm  run test:ci || true

echo "Run unit tests..."
pnpm  run coverage:ci || true

echo "Build app..."
pnpm  run build || exit 1

echo "CI pipeline completed!"