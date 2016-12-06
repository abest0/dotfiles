# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export PATH=$PATH:$HOME/.rbenv/bin

export ANDROID_HOME="/usr/local/Cellar/android-sdk/24.4.1_1"
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"
# export PATH=$PATH:"/Users/abest/applications/activator-1.2.3"

export PYTHONPATH="/usr/local/lib/python2.7/site-packages/"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export EDITOR='vim'

# export PATH="/usr/local/lib/node_modules/phonegap/bin:$PATH"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="utilitas-3"
#export ZSH_THEME="gallois"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ll='ls -l'
alias la='ls -a'
alias cls='clear'
# alias g='git'
#

# adding in a function to startup vim
function v
{
    if [[ $# > 0 ]]; then
        command vim --remote-silent "$@"
    else
        command vim
    fi
}


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
#DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for   completion
# COMPLETION_WAITING_DOTS="true"

setopt HIST_FIND_NO_DUPS
setopt histignorealldups sharehistory

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git rails ruby brew)
plugins=(git brew osx history-substring-search gradle go docker aws vi-mode)

source $ZSH/oh-my-zsh.sh
source ~/.bin/tmuxinator.zsh

bindkey -M viins 'jj' vi-cmd-mode

# Customize to your needs...
autoload -U colors
colors

alias dc=docker-compose
alias dm=docker-machine
eval "$(direnv hook zsh)"
