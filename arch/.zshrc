# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# ZPLUG
export ZPLUG_HOME="$HOME/.zplug"
source $ZPLUG_HOME/init.zsh

# >  History config
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# > zsh插件
# plugins=()

# > zplug 安装插件
# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Load theme file
zplug 'dracula/zsh', as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load

# starship init
eval "$(starship init zsh)"

# gpg commit
export GPG_TTY=$(tty)

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# kubectl
source <(kubectl completion zsh)

# ssh-agent
eval "$(ssh-agent -s)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
