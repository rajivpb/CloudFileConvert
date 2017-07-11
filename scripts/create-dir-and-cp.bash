#!/usr/bin/env bash

readarray -t files < wma-files.txt

for file in "${files[@]}"; do
    file_dir=$(dirname "$file")
    source_dir="../Music/$file_dir"
    dest_dir=$file_dir
    file_name=$(basename "$file")
    source_file="$source_dir/$file_name"
    mkdir -p "$dest_dir"
    cp "$source_file" "$dest_dir"
done

