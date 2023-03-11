#!/bin/bash -x

generate_graph() {
    echo "Generate a Graphviz dot of tasks dependencies using targets and dependencies"
    echo "implied by symbolic links."
    echo  
    echo "Usage: $0 [directory (default: ($PWD)]"
    echo "       [output (default: SymlinksTasks.dot)]" 
    echo "       [recursive (default: 1 [True])]" 
    echo "====================================================="
    echo

    local directory=${1:-.}   # default to current directory if no argument is provided
    local output="${2:-$PWD/SymlinksTasks.dot}"
    local recursive="${3:-1}"

    echo "Directory: $directory"
    echo "Output: $output"
    echo "Recursive: $recursive"

    if [[ $recursive -eq 1 ]]; then
        symlinks=$(find "$directory" -type l)
    else
        symlinks=$(find "$directory" -maxdepth 1 -type l)
    fi

    echo 'digraph SymlinksTasks {' > "$output"

    for link in $symlinks
    do
        symlink=$(echo "$link" | sed -e "s|$directory/||" -e 's|.*scripts/||' -e 's|/input.*||')
        source=$(readlink "$link" | sed -e "s|$directory/||" -e 's|.*scripts/||' -e 's|\.\./||g' -e 's|/output.*||')
        entry="\"$source\" -> \"$symlink\";"
        if ! grep -q "$entry" "$output"; then
            echo "$entry" >> "$output"
        fi
    done
    echo '}' >> "$output"
    echo "Saved to $output"
}

# # Call the function with default arguments (current directory, SymlinksTasks.dot, recursive search)
generate_graph "$1" "$2" "$3"

