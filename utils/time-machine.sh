#!/bin/bash

# Exclude all directories with a given name.
exclude_directory() {
    local dir_name="$1"
    local base_dir="$HOME/dev/code"

    find "$base_dir" -type d -name "$dir_name" | while read -r dir; do
        # Skip if path includes /resources/, /lang/, or /public/
        if echo "$dir" | grep -E '/(resources|lang|public)/' > /dev/null; then
            echo "Skipping (protected path): $dir"
            continue
        fi

        # Check if the directory is already excluded
        if sudo tmutil isexcluded "$dir" | grep -q "Excluded"; then
            echo "Already excluded: $dir"
            continue
        fi

        echo "Excluding: $dir"
        sudo tmutil addexclusion "$dir"
    done
}

# Exclude dev directories.
exclude_directory "node_modules"
exclude_directory "vendor"
