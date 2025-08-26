# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

export PATH=$HOME/.local/bin:$PATH:$HOME/bin:$HOME/.toolbox/bin

export NVM_DIR="$HOME/.nvm"

export EDITOR='vim'

export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
export LDFLAGS="-L/usr/local/opt/sqlite/lib -L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/sqlite/include -I/usr/local/opt/llvm/include"

# https://ansiblepilot.medium.com/why-ansible-and-python-fork-break-on-macos-high-sierra-and-how-to-solve-d11540cd2a1b
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES


# source '/usr/local/bin/virtualenvwrapper_lazy.sh'
