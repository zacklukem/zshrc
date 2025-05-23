
function sourceme {
    if [ "$1" = "--init" ]; then
        echo "Initializing sourceme"
        if [ -f "$PWD/.zlm_sourceme.zsh" ]; then
            echo "Sourceme already initialized"
            return 1
        fi

        echo "Creating $PWD/.zlm_sourceme.zsh"
        echo 'echo "TODO"' > "$PWD/.zlm_sourceme.zsh"
        return 0
    fi

    curr_dir=$(realpath "$PWD")
    file_name=".zlm_sourceme.zsh"

    found=no

    while true; do
        if [ -f "$curr_dir/$file_name" ]; then
            echo -e "    \033[32m[source]\033[0m $curr_dir/$file_name"
            export SOURCEME_ROOT="$curr_dir"
            source "$curr_dir/$file_name"
            found=yes
        fi
        if [ "$curr_dir" = "$HOME" ] || [ "$curr_dir" = "/" ]; then
            break
        fi
        curr_dir=$(realpath "$curr_dir/..")
    done

    if [ "$found" = no ]; then
        echo "No sourceme found"
        return 1
    fi
}

function cdd {
    cd "$ZLM_ORIGINAL_PWD"
}

