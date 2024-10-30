setopt extendedglob
setopt PROMPT_SUBST
# The following lines were added by compinstall
zstyle :compinstall filename '/home/boss/.zshrc'

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Immediately append to history file:
setopt INC_APPEND_HISTORY

# Record timestamp in history:
setopt EXTENDED_HISTORY

# Expire duplicate entries first when trimming history:
setopt HIST_EXPIRE_DUPS_FIRST

# Dont record an entry that was just recorded again:
setopt HIST_IGNORE_DUPS

# Delete old recorded entry if new entry is a duplicate:
setopt HIST_IGNORE_ALL_DUPS

# Do not display a line previously found:
setopt HIST_FIND_NO_DUPS

# Dont record an entry starting with a space:
setopt HIST_IGNORE_SPACE

# Dont write duplicate entries in the history file:
setopt HIST_SAVE_NO_DUPS

bindkey -e
# End of lines configured by zsh-newuser-install
#autoload -U promptinit
#promptinit
#prompt fire

# vcs info
autoload -Uz vcs_info
precmd () { vcs_info }

autoload -U colors && colors
# very simple fire promt 
PS1='%}%B%F{yellow}%K{black}%~/${vcs_info_msg_0_}%b%f%k
%b%F{black}%K{red}█▓▒░%b%F{yellow}%K{red}░▒▓█%b%F{red}%K{yellow}%(?..%?)%B%F{yellow}%K{yellow}░▒▓█%b%k%f%B%F{yellow}%b%f%k  '
# Prompt without pc name
#PS1='%}%B%F{yellow}%K{black}%~/%b%f%k
#%b%F{black}%K{red}█▓▒░%b%F{yellow}%K{red}░▒▓█%B%F{yellow}%K{yellow}░▒▓█%b%k%f%B%F{yellow}%b%f%k  '
# Prompt with pc name
#PS1='%}%B%F{yellow}%K{black}%~/%b%f%k
#%b%F{black}%K{red}█▓▒░%b%F{yellow}%K{red}░▒▓█%B%F{white}%K{yellow}%n@%m%B%F{yellow}%K{yellow}░▒▓█%b%k%f%B%F{yellow}%b%f%k  '
#PS1='%}%B%F{yellow}%K{black}%~/%b%f%k
#%b%F{black}%K{red}%{█▓▒░%}%b%F{yellow}%K{red}%{░▒▓█%}%B%F{white}%K{yellow}%n@%m%B%F{yellow}%K{yellow}%{░▒▓█%}%B%F{yellow}%{%}%b%f%k  '
# Aliases
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'

autoload -Uz compinit
compinit
# Ruby support
PATH=${PATH}:~/.gem/ruby/2.5.0/bin

# Haskell Stack local support
PATH=${PATH}:/home/boss/.local/bin

# delete to a slash or a word in zsh?
# https://unix.stackexchange.com/questions/258656/how-can-i-delete-to-a-slash-or-a-word-in-zsh
#WORDCHARS=${WORDCHARS/\/}
#autoload -U select-word-style
#backward-kill-dir () {
#    local WORDCHARS=${WORDCHARS/\/}
#    zle backward-kill-word
#}
#zle -N backward-kill-dir
#bindkey '^[^?' backward-kill-dir


# missing keybindings
bindkey  "^[[3~"   delete-char
export EDITOR="nvim -u NONE"

# Add golang vars
export GOPATH=~/.go
PATH=${PATH}:${GOPATH}/bin/

# Add cargo env
PATH=${PATH}:~/.cargo/bin

# Ssh keys managemet
eval $(keychain --eval --quiet id_rsa)

# Enable fzf
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
alias config='/usr/bin/git --git-dir=/home/boss/codes/dotfiles2 --work-tree=/home/boss'
alias vim='nvim'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
export XDG_CURRENT_DESKTOP=sway
export MANPAGER='nvim +Man!'
export MOZ_ENABLE_WAYLAND=1

## Enable pyenv https://github.com/pyenv/pyenv?tab=readme-ov-file#readme
#export PYENV_ROOT="$HOME/.pyenv"
#[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

## YTSAURUS STUFF
export YT_PROXY=jupiter.yt.vk.team
export YT_TOKEN=$(cat ~/.yt/token)

