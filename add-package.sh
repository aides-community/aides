#!/bin/bash

PACKAGE_REPO="$1"

if [[ -z "$PACKAGE_REPO" ]]; then
    echo "Error: Repository name must be provided as an argument." >&2
    exit 1
fi

if jq -e 'has("'$PACKAGE_REPO'")' repos.json > /dev/null; then
    echo "Error: Repository already exists!" >&2
    exit 1
else
    jq --indent 4 '. + { "'$PACKAGE_REPO'": "" }' repos.json > tmp.json && mv tmp.json repos.json
    echo "Repository added successfully."
fi
