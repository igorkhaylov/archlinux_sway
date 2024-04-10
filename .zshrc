# Created by newuser for 5.9

# If running from tty1 start sway
[ "$(tty)" = "/dev/tty1" ] && exec sway

### Здесь %n отображает имя пользователя, %m — имя хоста до первой точки, %1~ — сокращенный текущий рабочий каталог, а %# — символ # для root и $ для обычных пользователей.
#PROMPT='%n@%m %1~ %# '
PROMPT='[%F{2}%n%f@%F{5}%m%f %F{4}%B%~%b%f]$ '
#RPROMPT='[%F{3}%?%f]'

autoload -Uz compinit
compinit
zstyle ':completion:*' file-patterns '^*.(sh|zsh)(-.)' '*:all-files'

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias ssh="TERM=xterm-256color $(which ssh)"
alias scp='noglob scp'

# For Alt+Arrow
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

export EDITOR=vim
export VISUAL="$EDITOR"
