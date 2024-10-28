#!/usr/bin/env bash
# Copyright (C) 2023, Ava Labs, Inc. All rights reserved.
# See the file LICENSE for licensing terms.
echo "Starting script execution..."


set -o errexit
set -o nounset
set -o pipefail

echo "Starting script execution..."

# Get the directory of the script, even if sourced from another directory
SCRIPT_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
echo "Script directory: $SCRIPT_DIR"

# shellcheck source=/common/build.sh
source "$SCRIPT_DIR"/common/build.sh
echo "Sourced build.sh"

# shellcheck source=/common/constants.sh
source "$SCRIPT_DIR"/common/constants.sh
echo "Sourced constants.sh"

# Construct the correct path to namevm directory
NAMEVM_PATH=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  cd .. && pwd
)
echo "NAMEVM_PATH: $NAMEVM_PATH"

# Print number of arguments
echo "Number of arguments: $#"

# if there's exactly one argument use it as the output path to go build
if [[ $# -eq 1 ]]; then
    echo "Building with output path: $1"
    go build -o "$1" ./cmd/namevm
    echo "Build completed with output path"
    exit 0
fi

echo "BOUH"
echo "Building project with default settings..."
build_project "$NAMEVM_PATH" "namevm" "pkEmJQuTUic3dxzg8EYnktwn4W8uCHofNcwiYo458vodAUbY7"