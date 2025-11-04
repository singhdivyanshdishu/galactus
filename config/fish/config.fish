set fish_greeting

# Add Q to PATH
contains $HOME/.local/bin $PATH; or set -a PATH $HOME/.local/bin

# Add Anaconda to PATH (single export)
set -gx PATH $HOME/anaconda3/bin $PATH

# Lazy load Amazon Q
function q
    if not functions -q __q_loaded
        if command -qv q
            eval (command q init fish pre --rcfile 00_fig_pre | string split0)
            eval (command q init fish post --rcfile 99_fig_post | string split0)
            function __q_loaded; end
        else
            echo "Amazon Q not found"
            return 1
        end
    end
    command q $argv
end
