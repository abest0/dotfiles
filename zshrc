# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/.local/share/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/.local/share/amazon-q/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_CUSTOM=$HOME/dotfiles/zsh_custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="powerlevel10k/powerlevel10k"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ll='ls -l'
alias la='ls -a'
alias cls='clear'
alias is='isengardcli'
# alias g='git'
#

# adding in a function to startup vim
function v
{
    if [[ $# > 0 ]]; then
        command vim "$@"
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
plugins=(git aws history-substring-search golang docker vi-mode nvm )
# plugins=(git brew osx aws history-substring-search gradle go docker vi-mode)

bindkey -M viins 'jj' vi-cmd-mode
# allow ctrl-a to go to beginning of line while in insert mode
bindkey '^a' beginning-of-line
# # allow ctrl-e to go to end of line while in insert mode
bindkey '^e' end-of-line

# Customize to your needs...
autoload -U colors
colors

alias dc=docker-compose
alias dm=docker-machine

alias pj='pnpm exec projen'
alias pt='poetry'
alias pn='pnpm nx'
#eval "$(direnv hook zsh)"
#

# source custom specific configuration
if [ -d $HOME/dotfiles/custom ]; then
    for f in $HOME/dotfiles/custom/*.sh(.N); do
        source $f
    done
fi

source $ZSH/oh-my-zsh.sh
# Shell to run on AWS linux machines to enable aws completion in zsh
# source /usr/share/zsh/site-functions/aws_zsh_completer.sh
#

function install_jsctags {
    npm install jsctags
    # https://github.com/mozilla/doctorjs/issues/52
    sed -i '51i tags: [],' ./node_modules/jsctags/ctags/index.js
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/abest/.nvm/versions/node/v8.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/abest/.nvm/versions/node/v8.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/abest/.nvm/versions/node/v8.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/abest/.nvm/versions/node/v8.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# export PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

# pnpm
export PNPM_HOME="/home/dev/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# eval "$(/home/dev/.local/bin/mise activate zsh)"
eval "$(direnv hook zsh)"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/.local/share/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/.local/share/amazon-q/shell/zshrc.post.zsh"
