#!/bin/sh

set -e

python -m venv venv
venv/bin/pip install -r requirements.txt

find . -not -path './venv/*' -type f \( -iname '*.c' -o -iname '*.h' \) -print0 \
    | xargs -0 venv/bin/clang-format -i
