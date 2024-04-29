HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep
zstyle :compinstall filename '/home/przekichane/.zshrc'

autoload -Uz compinit
compinit

[[ -z $DISPLAY ]] && [[ "$(tty)" = "/dev/tty1" ]] && exec sway --unsupported-gpu
export XDG_CURRENT_DESKTOP=sway

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b'

setopt prompt_subst
PROMPT="[%n@%m %1~]$ "
RPROMPT=\$vcs_info_msg_0_

# Pos1 (home) & Ende (End) keys
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# delete key:
bindkey  "^[[3~"  delete-char

# cntrl + left / right
bindkey ";5D" backward-word
bindkey ";5C" forward-word

if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Fixes HEAD^ with extendedglob
unsetopt nomatch

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
