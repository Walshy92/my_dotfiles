# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/Users/harry/.bin:$PATH

# RVM (ruby version manager)

# Path to your oh-my-zsh installation.

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="af-magic"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git rails ruby brew npm zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# source for auto highlighting plugin in zsh shell
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
setopt correct

# User configuration
export EDITOR=/usr/local/bin/nvim

export TWITTER_OAUTH_ID="FpdTAUQHQAUdlhC58DjKBpnVP"
export TWITTER_OAUTH_SECRET="7Yr6OansByoOeno8M08I6eLst6HfRCUPZ59pkOD8i3bQr6iYzD"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

function precmd() {
  echo -ne "\e]1;${PWD##*/}\a"
}

function mygr8() {
  bin/rake db:migrate
  bin/rake db:migrate RAILS_ENV=test
}

function rollback() {
  if [ !($1 = "") ]
  then
    bin/rake db:rollback STEP=$1
    bin/rake db:rollback STEP=$1 RAILS_ENV=test
  else
    bin/rake db:rollback
    bin/rake db:rollback RAILS_ENV=test
  fi
}

function update(){
  git fetch origin master:master && git rebase master
}

function ssh-copy-id() {
  cat ~/.ssh/id_rsa.pub | ssh $1 "mkdir -p ~/.ssh; cat >> ~/.ssh/authorized_keys";
}

function mcd() { # creates a directory and places you in it
  mkdir -p $1
  cd $1
}

function update-master() {
  if [ $(git rev-parse --abbrev-ref HEAD) = "master" ]
  then
    git pull
  else
    git fetch origin master:master
  fi
  git fetch --all --prune
}

function start-branch() {
  git stash save tempforbranch
  update-master && git checkout master
  git checkout -b $1
  if [[ ! -z $(git stash list | grep tempforbranch | grep -oE "(\d+)") ]]
  then
    git stash apply stash@$(git stash list | grep tempforbranch | grep -oE "\{(\d+)\}")
    git stash drop stash@$(git stash list | grep tempforbranch | grep -oE "\{(\d+)\}")
  fi
  bundle
  clear
}

function finish-branch() {
  BRANCH="$(git rev-parse --abbrev-ref HEAD)"
  if [ "${BRANCH}" = "master" ]
  then
    echo "ERROR: cannot finish master"
    return 1
  fi

  git push --set-upstream origin "${BRANCH}" && {
    bundle exec cap production gitlab:release
    update-master
    git checkout master
    git branch -D "${BRANCH}"
  }
}

alias mydotfiles='git --git-dir=$HOME/.my-dotfiles/ --work-tree=$HOME'

alias vim=nvim
alias bx='bundle exec'

alias rake='noglob rake'

# git aliases
alias git='noglob git'

alias gs='git status -s'
alias gc='git commit'
alias ga='git add'
alias gd='git diff -w --patience'
alias gpo='git push origin'
alias gplo='git pull origin'
alias gh='git hist'
alias gsh='git show'

alias paned-ssh="osascript ~/Library/Application\\ Support/iTerm/Scripts/paned-ssh.scpt"
alias ssh-concord="paned-ssh concord@adm01.concord.tagadab.com concord@app01.concord.tagadab.com concord@app02.concord.tagadab.com"
alias ssh-bullet="paned-ssh deploy@bullet.tagadab.com deploy@speeding.tagadab.com"
alias ssh-nephos="paned-ssh deploy@adm01.nephos.tagadab.com deploy@adm02.nephos.tagadab.com deploy@app01.nephos.tagadab.com deploy@app02.nephos.tagadab.com"
alias ssh-git="paned-ssh root@git.tagadab.com root@95.172.8.85"

alias mdf='mydotfiles'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# source for z autocomplete
. `brew --prefix`/etc/profile.d/z.sh

# use vim as the default pager for man pages
export MANPAGER="col -b | vim -c 'set ft=man ts=8 nomod nolist nonu' -c 'nnoremap i <nop>' -"

fpath=(~/.zsh/Completion $fpath)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

unalias rg

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
