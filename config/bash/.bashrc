# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Basic aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# History settings
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Enable color prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Random fastfetch display
if command -v fastfetch &> /dev/null; then
    case $((RANDOM % 6)) in
        0) fastfetch ;;
        1) fastfetch | lolcat ;;
        2) fastfetch --config neofetch ;;
        3) fastfetch --config paleofetch ;;
        4) fastfetch --config examples/13 ;;
        5) fastfetch --config examples/26 ;;
    esac
fi

# Add Anaconda to PATH (single export)
export PATH="$HOME/anaconda3/bin:$PATH"
