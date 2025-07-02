#!/bin/bash
set -e

PROJECT_PATH="/home/bitnami/stack/project/frontend/"
BACKUP_PATH="/home/bitnami/temp"
BUILD_TAG="build-${BUILD_NUMBER}"

# Create temp directory if it doesn't exist
mkdir -p "$BACKUP_PATH"

# Navigate to the project directory
cd "$PROJECT_PATH" || exit

# Backup old files if the directory is not empty
if [ "$(ls -A "$PROJECT_PATH")" ]; then
  zip -r "$BACKUP_PATH/$BUILD_TAG.zip" ./*
  rm -rf ./*
fi
