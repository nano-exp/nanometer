#!/usr/bin/env bash
cd "$(dirname "$0")" || exit 1

PLATFORM="$(uname -s | tr '[:upper:]' '[:lower:]')"

NODE_VERSION='17.8.0'

NODE_DISTRIBUTION_FILE_NAME="node-v$NODE_VERSION-$PLATFORM-x64"

NODE_DISTRIBUTION_FILE_NAME_WITH_EXTENSION="$NODE_DISTRIBUTION_FILE_NAME.tar.gz"
NODE_URL="https://nodejs.org/dist/v$NODE_VERSION/$NODE_DISTRIBUTION_FILE_NAME_WITH_EXTENSION"

if [ -d "$NODE_DISTRIBUTION_FILE_NAME" ]; then
    rm -rf "$NODE_DISTRIBUTION_FILE_NAME"
fi

curl "$NODE_URL" -o "$NODE_DISTRIBUTION_FILE_NAME_WITH_EXTENSION"
tar -xzf "$NODE_DISTRIBUTION_FILE_NAME_WITH_EXTENSION"
rm "$NODE_DISTRIBUTION_FILE_NAME_WITH_EXTENSION"

echo "export PATH=$(pwd)/$NODE_DISTRIBUTION_FILE_NAME/bin:\$PATH" >> .profile

. .profile
npm install --global pnpm@6.32.4

echo 
echo 'Setup Node.js: '"$NODE_DISTRIBUTION_FILE_NAME"