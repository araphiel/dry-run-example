#!/bin/bash

find ./packages -type d -name 'dist' | while IFS= read -r dist_dir; do
  parent_dir=$(basename "$(dirname "$dist_dir")")
  (cd "$dist_dir" && zip -r "../${parent_dir}.zip" .)
done