#!/usr/bin/env bash
# Copyright (C) 2023, Ava Labs, Inc. All rights reserved.
# See the file LICENSE for licensing terms.

set -e

NAMEVM_PATH=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  cd .. && pwd
)
echo "Path " $NAMEVM_PATH/tests/e2e/e2e.test
ginkgo -v "$NAMEVM_PATH"/tests/e2e/e2e.test -- --stop-network
