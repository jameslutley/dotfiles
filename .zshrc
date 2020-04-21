# —————————————————————————————————————————
# Zsh Config
# —————————————————————————————————————————

# antibody Config
# —————————————————————————————————————————

# Loads autibody
source <(antibody init)

# Loads plugins
antibody bundle < ~/.zsh_plugins.txt

# macOS Settings
# —————————————————————————————————————————

# Fixes slow key repeat in macOS High Sierra
# http://marianposaceanu.com/articles/macos-sierra-upgrade-from-a-developers-perspective
# https://discussions.apple.com/thread/7682417?start=0&tstart=0
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 12

# General Zsh Settings
# —————————————————————————————————————————

export PATH="/usr/local/bin:$PATH" # Add Homebrew’s location to PATH
export PATH="/Users/jameslutley/.composer/vendor/bin:$PATH"
export CACHE_DIR="$HOME/.cache"

[[ ! -d "$CACHE_DIR" ]] && mkdir -p "$CACHE_DIR"

# History Settings
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTFILE="$CACHE_DIR/.zsh_history"
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Add homebrew to the completion path
fpath=("/usr/local/bin/" $fpath)

# Make Homebrew’s completions available in zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Editors
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

# Open tmux at startup
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';
export JOBS=max # tell npm to install concurrently

export SSH_KEY_PATH="$HOME/.ssh"
export AWS_CONFIG_FILE="$HOME/.aws/config"
export AWS_DEFAULT_PROFILE="default"

# Enable autocomplete autocorrection
zstyle ':completion:*' completer _expand _complete _approximate

# Highlight autocomplete selection on tab
zstyle ':completion:*' menu select

# Shift-tab reverses the autocomplete selection direction on tab
bindkey '^[[Z' reverse-menu-complete

# Setup aliases for starting Neovim and enabling 24-bit true color
alias v='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'

# Setup 24-bit true color in SSH
alias ssh='TERM=screen-256color ssh'

# Configure fuzzy completions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit && compinit

# Add tmuxinator completions
source ~/.bin/tmuxinator.zsh

# Enable iTerm2 Shell Integration
# source ~/.iterm2_shell_integration.zsh

setopt append_history
setopt bang_hist                # !keyword
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify
setopt inc_append_history
setopt share_history

setopt auto_cd                  # if command is a path, cd into it
setopt auto_remove_slash        # self explicit
setopt chase_links              # resolve symlinks
setopt correct                  # try to correct spelling of commands
setopt extended_glob            # activate complex pattern globbing
setopt glob_dots                # include dotfiles in globbing
setopt print_exit_value         # print return value if non-zero
setopt no_beep # Disable sound
setopt prompt_subst

unsetopt beep                   # no bell on error
unsetopt bg_nice                # no lower prio for background jobs
unsetopt clobber                # must use >| to truncate existing files
unsetopt hist_beep              # no bell on error in history
unsetopt hup                    # no hup signal at shell exit
unsetopt ignore_eof             # do not exit on end-of-file
unsetopt list_beep              # no bell on ambiguous completion
unsetopt rm_star_silent         # ask for confirmation for `rm *' or `rm path/*'

unsetopt menu_complete
unsetopt flowcontrol

setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word         # allow completion from within a word/phrase
setopt auto_menu
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

zstyle ':zplug:tag' depth 42
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/etc/php/7.3/bin:$PATH"
export PATH="/usr/local/etc/php/7.3/sbin:$PATH"

# asdf global version manager
# source "$HOME/.asdf/asdf.sh"
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# set yarn binaries on path
# must be below the .asdf source commands ^
export PATH="$(yarn global bin):$PATH"
