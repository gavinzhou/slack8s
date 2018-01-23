#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

if [ -z "${TAG_NAME:-}" ]; then
  TAG_NAME="$(git describe --always --tags)"
fi

cat << EOF
TAG_NAME ${TAG_NAME}
EOF
