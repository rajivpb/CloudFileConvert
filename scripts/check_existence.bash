while IFS= read -r f; do
    if [[ -e $2/$f ]]; then
        printf '.'
    else
        printf '%s is missing in %s\n' "$f" "$2"
    fi
done < "$1"