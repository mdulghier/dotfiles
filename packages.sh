#!/bin/bash


# ncdu       - ncurses disk usage
# entr       - file system watcher
# jq         - json parser
# fasd       - autojump alternative with some extras
# httpie     - friendly curl alternative
# lnav       - log file viewer
# shellcheck - linter for shell scripts
# htop       - nice top

sudo apt install -yqq ncdu entr jq fasd httpie lnav shellcheck htop         

# bat - a nice cat alternative:update
if [ ! -x "$(command -v bat)" ]; then
    wget -q -O /tmp/bat.deb https://github.com/sharkdp/bat/releases/download/v0.6.1/bat_0.6.1_amd64.deb
    sudo dpkg -i /tmp/bat.deb
    rm -f /tmp/bat.deb
fi

# NVM
if [ ! -x "$(command -v nvm)" ]; then
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
fi

# ripgrep
if [ ! -x "$(command -v rg)" ]; then
    wget -q -O /tmp/ripgrep.deb https://github.com/BurntSushi/ripgrep/releases/download/0.9.0/ripgrep_0.9.0_amd64.deb
    sudo dpkg -i /tmp/ripgrep.deb
    rm -f /tmp/ripgrep.deb
fi

cat <<EOF > "${HOME}/.nvm/default-packages" 
tldr
bash-language-server
javascript-typescript-langserver
meta
bunyan
eslint
EOF

