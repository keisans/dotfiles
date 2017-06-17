BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load Prezto and modules
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"  ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Add completions to the fpath
fpath=(/usr/local/share/zsh-completions $fpath)

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.rvm/bin"

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"


#BASE16_SHELL="$HOME/.zsh/base16-shell/base16-monokai.dark.sh"
#[[ -s $BASE16_SHELL  ]] && source $BASE16_SHELL

# Load in z
. `brew --prefix`/etc/profile.d/z.sh

#**** FZF ***************
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(cat {} || tree -C {}) 2> /dev/null | head -$LINES'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden --bind ?:toggle-preview"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -$LINES'"
# fzf switch git branches
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
    fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

#export NVM_DIR="${HOME}/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
