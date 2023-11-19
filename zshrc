# Aliases
alias l='ls -lAFh'
alias bat='batcat'

# Prompts
PROMPT='
%n@%m %1~ %L %# '

RPROMPT='%*'

#Fuctions
funcion mkcd(){
	mkdir -p "$@" && cd "$_";
}

#Bat
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

