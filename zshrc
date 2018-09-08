#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Markus Dulghier <markus@dulghier.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customizations
#

setopt AUTO_CD
setopt MULTIOS
setopt AUTO_PUSHD
setopt GLOB_COMPLETE
setopt PUSHD_MINUS
setopt PUSHD_TO_HOME
setopt NO_FLOW_CONTROL
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT

stty -ixon

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

export EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export COLORTERM=truecolor

# Additional alias definitions
[ -f ~/.aliases ] && . ~/.aliases

# FZF
[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh

# NVM Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

[ -f /usr/share/autojump/autojump.sh ] && source /usr/share/autojump/autojump.sh
