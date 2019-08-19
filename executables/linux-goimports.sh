#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
GOOS=linux CGO_ENABLED=0 "$DIR/goimports" "$@"

