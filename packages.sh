#!/bin/bash

os_release=$(grep -oP "^ID=\K.*" /etc/os-release)
echo "--> detected ${os_release}"

# ncdu       - ncurses disk usage
# entr       - file system watcher
# jq         - json parser
# fasd       - autojump alternative with some extras
# httpie     - friendly curl alternative
# lnav       - log file viewer
# shellcheck - linter for shell scripts
# htop       - nice top

if [ "${os_release}" == "ubuntu" ]; then
	sudo apt install -yqq ncdu entr jq fasd httpie lnav shellcheck htop         
elif [ "${os_release}" == "fedora" ]; then
	sudo dnf install -y ncdu entr jq fasd httpie lnav ShellCheck htop         
fi

# NVM
if [ ! -x "$(command -v nvm)" ]; then
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
fi

# ripgrep
if [ ! -x "$(command -v rg)" ]; then
  if [ "${os_release}" == "ubuntu" ]; then
    wget -q -O /tmp/ripgrep.deb https://github.com/BurntSushi/ripgrep/releases/download/0.9.0/ripgrep_0.9.0_amd64.deb
    sudo dpkg -i /tmp/ripgrep.deb
    rm -f /tmp/ripgrep.deb
  elif [ "${os_release}" == "fedora" ]; then
    sudo dnf install -y ripgrep
  fi
fi

cat <<EOF > "${HOME}/.nvm/default-packages" 
tldr
bash-language-server
javascript-typescript-langserver
meta
bunyan
eslint
EOF

