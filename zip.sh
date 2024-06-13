#!/bin/bash

find . -type d -name 'dist' -path '*/packages/*' | while read -r dir; do
  parent_dir=$(basename "$(dirname "$dir")")
  zip -r "${dir%/*}/${parent_dir}.zip" "$dir"
done