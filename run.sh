#!/bin/bash

### ./run.sh {s3_path}

S3_URL="$1"

if [ -z "$S3_URL" ]; then
  echo "need s3 url"
  exit 1
fi

DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

cd "$DIR"

export DAY_RANGE=14

./nrd-list-downloader.sh

aws s3 cp nrd-14days-free.txt "$S3_URL"
