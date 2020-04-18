#!/bin/bash

set -e

export "$(xargs <.env)"

github-release upload \
    --user boilerplato \
    --repo rust-cli-template \
    --tag "v$1" \
    --name "rust-cli-template-v$1-x86_64-apple-darwin.tar.gz" \
    --file "dist/rust-cli-template-v$1-x86_64-apple-darwin.tar.gz"

github-release upload \
    --user boilerplato \
    --repo rust-cli-template \
    --tag "v$1" \
    --name "rust-cli-template-v$1-x86_64-unknown-linux-gnu.tar.gz" \
    --file "dist/rust-cli-template-v$1-x86_64-unknown-linux-gnu.tar.gz"

github-release upload \
    --user boilerplato \
    --repo rust-cli-template \
    --tag "v$1" \
    --name "rust-cli-template-v$1-x86_64-pc-windows-gnu.zip" \
    --file "dist/rust-cli-template-v$1-x86_64-pc-windows-gnu.zip"
