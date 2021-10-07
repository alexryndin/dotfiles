setopt extendedglob
# The following lines were added by compinstall
zstyle :compinstall filename '/home/boss/.zshrc'

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
bindkey -e
# End of lines configured by zsh-newuser-install
#autoload -U promptinit
#promptinit
#prompt fire
autoload -U colors && colors
# very simple fire promt 
PS1='%}%B%F{yellow}%K{black}%~/%b%f%k
%b%F{black}%K{red}█▓▒░%b%F{yellow}%K{red}░▒▓█%B%F{yellow}%K{yellow}░▒▓█%b%k%f%B%F{yellow}%b%f%k  '
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
WORDCHARS=${WORDCHARS/\/}
autoload -U select-word-style
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
export GOPATH=~/codes/go
PATH=${PATH}:${GOPATH}/bin/

# Add cargo env
PATH=${PATH}:~/.cargo/bin

# Ssh keys managemet
eval $(keychain --eval --quiet id_rsa id_rsa_mailrudell)

# Enable fzf
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
alias config='/usr/bin/git --git-dir=/home/boss/codes/dotfiles2 --work-tree=/home/boss'
alias vim='nvim'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
export XDG_CURRENT_DESKTOP=sway
