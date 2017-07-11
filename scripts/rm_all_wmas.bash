#!/usr/bin/env bash

readarray -t files < wma-files.txt

for file in "${files[@]}"; do
    rm "$file"
done

