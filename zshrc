# Enable timing functions
autoload -Uz add-zsh-hook
add-zsh-hook preexec preexec
add-zsh-hook precmd precmd


# Aliases
alias l='ls -lAFh'
alias bat='batcat'

# Prompts
# PROMPT=
# %n@%m %1~ %L %# '
PROMPT='%F{magenta}[%f%F{yellow}%n%f@%F{green}%m%f%F{magenta}]%f%F{cyan} %1~ %f%F{yellow}%L%f '


#Fuctions
#Make folder and cd into it
function mkcd(){
	mkdir -p "$@" && cd "$_";
}

#Add the execution time of the last command to RPROMPT
function preexec() {
  timer=$(($(date +%s%0N)/1000000))
}

function precmd() {
  if [ $timer ]; then
    now=$(($(date +%s%0N)/1000000))
    elapsed=$(($now-$timer))

    export RPROMPT="%* ${elapsed}s
    "
    unset timer
  fi
}

#Bat
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
