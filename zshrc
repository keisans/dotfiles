BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load Prezto and modules
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"  ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# POWERLEVEL9K CONFIG
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"


# Preferred editor for local and remote sessions
export EDITOR='vim'

# Set vi-style prompt editing
bindkey -v

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"


alias zshconfig="vim ~/.zshrc"
source ~/.aliases.zsh

source ~/.custom_functions.zsh

export XDG_CONFIG_HOME="${HOME}/.xdg_config"

BASE16_SHELL="$HOME/.zsh/base16-shell/base16-monokai.dark.sh"
[[ -s $BASE16_SHELL  ]] && source $BASE16_SHELL

# Load in z
. `brew --prefix`/etc/profile.d/z.sh

export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc
