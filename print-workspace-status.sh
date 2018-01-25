#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

cat << EOF
TAG_NAME ${TAG_NAME}
EOF
