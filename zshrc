# Aliases
alias l='ls -lAFh'
alias bat='batcat'

# Prompts
PROMPT='
%n@%m %1~ %L %# '

# RPROMPT='%*'

#Fuctions
funcion mkcd(){
	mkdir -p "$@" && cd "$_";
}

#Bat
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

function preexec() {
  timer=$(($(date +%s%0N)/1000000))
}

function precmd() {
  if [ $timer ]; then
    now=$(($(date +%s%0N)/1000000))
    elapsed=$(($now-$timer))

    export RPROMPT="%* ${elapsed}ms"
    unset timer
  fi
}