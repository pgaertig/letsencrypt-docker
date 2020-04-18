#!/bin/bash

set -e

# Check for required environment variables.
for var in DOMAINS EMAIL; do
    eval [[ -z \${$var+1} ]] && {
        >&2 echo "ERROR: Missing required environment variable: $var"
        exit 1
    }
done

# Convert newline separator to semi-colon for consistency.
export DOMAINS=${DOMAINS//'\n'/;}

exec "${@:-bash}"
