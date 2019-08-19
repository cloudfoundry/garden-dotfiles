#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
if [ ! -f "$DIR/goimports" ]; then
  go build -o $DIR/goimports golang.org/x/tools/cmd/goimports
fi
GOOS=linux CGO_ENABLED=0 "$DIR/goimports" "$@"
