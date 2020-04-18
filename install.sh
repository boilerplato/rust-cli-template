#!/bin/bash

set -e

LATEST_TAG="$(curl -fsSL "https://api.github.com/repos/boilerplato/rust-cli-template/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')"

LINUX_ARTIFACT="https://github.com/boilerplato/rust-cli-template/releases/download/${LATEST_TAG}/rust-cli-template-${LATEST_TAG}-x86_64-unknown-linux-gnu.tar.gz"
MACOS_ARTIFACT="https://github.com/boilerplato/rust-cli-template/releases/download/${LATEST_TAG}/rust-cli-template-${LATEST_TAG}-x86_64-apple-darwin.tar.gz"

PWD="$(pwd)"
INSTALLATION_DIR="/usr/local/bin"
CLONE_FILE_NAME="rust-cli-template.output.tar.gz"
CLONE_DIR="/tmp"
CLONE_PATH="${CLONE_DIR}/${CLONE_FILE_NAME}"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "rust-cli-template ${LATEST_TAG}"
  echo "Downlaoding artifact from ${LINUX_ARTIFACT}..."
  curl -fsSL "${LINUX_ARTIFACT}" --output "${CLONE_PATH}"
  cd "${CLONE_DIR}"
  echo "Extracting..."
  tar -xvf "${CLONE_FILE_NAME}"
  echo "Installing..."
  mv rust-cli-template "${INSTALLATION_DIR}/rust-cli-template"
  rm -rf "${CLONE_FILE_NAME}"
  echo "Installed at ${INSTALLATION_DIR}/rust-cli-template"
  cd "${PWD}"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "rust-cli-template ${LATEST_TAG}"
  echo "Downlaoding artifact from ${MACOS_ARTIFACT}..."
  curl -fsSL "${MACOS_ARTIFACT}" --output "${CLONE_PATH}"
  cd "${CLONE_DIR}"
  echo "Extracting..."
  tar -xvf "${CLONE_FILE_NAME}"
  echo "Installing..."
  mv rust-cli-template "${INSTALLATION_DIR}/rust-cli-template"
  rm -rf "${CLONE_FILE_NAME}"
  echo "Installed at ${INSTALLATION_DIR}/rust-cli-template"
  cd "${PWD}"
else
  echo "Sorry! No build found for the current operating system."
  echo "Please raise an issue here: https://github.com/boilerplato/rust-cli-template/issues/new"
fi
