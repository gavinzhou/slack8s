#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

if [ -z "{TAG_NAME:-}" ]; then
    GIT_TAG=$(git describe --abbrev=0 --tags 2>/dev/null || echo $TAG_NAME)
fi
cat << EOF
STABLE_BUILD_GIT_TAG ${GIT_TAG:-}
EOF
