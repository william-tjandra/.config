# Node/nvm/npm
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc"
export NVM_DIR="$HOME/.config/nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"