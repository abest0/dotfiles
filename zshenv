# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

export GOPATH=$HOME/go
export PATH=$PATH:$HOME/bin:$GOPATH/bin

export NVM_DIR="$HOME/.nvm"

export EDITOR='vim'

export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'

export VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python3'
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh

source '/usr/local/bin/virtualenvwrapper_lazy.sh'
# source '/usr/local/opt/nvm/nvm.sh'
