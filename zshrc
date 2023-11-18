# Aliases
alias l='ls -lAFh'

# Prompts
PROMPT='
%n@%m %1~ %L %# '

RPROMPT='%*'

#Fuctions
funcion mkcd(){
	mkdir -p "$@" && cd "$_";
}
