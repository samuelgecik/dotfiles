# Enable timing functions
autoload -Uz add-zsh-hook
add-zsh-hook preexec preexec
add-zsh-hook precmd precmd

# History in cache directory:
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

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

    export RPROMPT="%* ${elapsed}ms"
    unset timer
  fi
}

#Bat
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

#\\\_ COMPLETIONS _///#
# Basic auto/tab complete:
autoload -U compinit
# zstyle ':completion:*' completer _complete _match _approximate
# zstyle ':completion:*' menu select
zstyle ':completion:*' menu select fg=white,bg=blue
# zstyle ':completion:*' menu yes fg=black,bg=cyan
# zstyle ':completion:*' menu no fg=black,bg=red
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

#PATH
export PATH="/home/samo/.local/bin:$PATH"

alias fabric='/home/samo/.cache/pypoetry/virtualenvs/fabric-L4raEQJt-py3.11/bin/fabric'

alias fabric-api='/home/samo/.cache/pypoetry/virtualenvs/fabric-L4raEQJt-py3.11/bin/fabric-api'

alias fabric-webui='/home/samo/.cache/pypoetry/virtualenvs/fabric-L4raEQJt-py3.11/bin/fabric-webui'

alias yt='/home/samo/.cache/pypoetry/virtualenvs/fabric-L4raEQJt-py3.11/bin/yt'
alias create_command='fabric --pattern create_command'
alias extract_recommendations='fabric --pattern extract_recommendations'
alias explain_docs='fabric --pattern explain_docs'
alias extract_sponsors='fabric --pattern extract_sponsors'
alias summarize_rpg_session='fabric --pattern summarize_rpg_session'
alias extract_wisdom='fabric --pattern extract_wisdom'
alias create_visualization='fabric --pattern create_visualization'
alias analyze_threat_report='fabric --pattern analyze_threat_report'
alias rate_content='fabric --pattern rate_content'
alias create_aphorisms='fabric --pattern create_aphorisms'
alias create_mermaid_visualization='fabric --pattern create_mermaid_visualization'
alias create_logo='fabric --pattern create_logo'
alias summarize='fabric --pattern summarize'
alias analyze_claims='fabric --pattern analyze_claims'
alias find_hidden_message='fabric --pattern find_hidden_message'
alias create_npc='fabric --pattern create_npc'
alias extract_ideas='fabric --pattern extract_ideas'
alias explain_code='fabric --pattern explain_code'
alias analyze_incident='fabric --pattern analyze_incident'
alias create_markmap_visualization='fabric --pattern create_markmap_visualization'
alias improve_prompt='fabric --pattern improve_prompt'
alias write_semgrep_rule='fabric --pattern write_semgrep_rule'
alias clean_text='fabric --pattern clean_text'
alias agility_story='fabric --pattern agility_story'
alias analyze_prose_json='fabric --pattern analyze_prose_json'
alias create_keynote='fabric --pattern create_keynote'
alias analyze_prose='fabric --pattern analyze_prose'
alias label_and_rate='fabric --pattern label_and_rate'
alias analyze_paper='fabric --pattern analyze_paper'
alias write_essay='fabric --pattern write_essay'
alias summarize_newsletter='fabric --pattern summarize_newsletter'
alias improve_writing='fabric --pattern improve_writing'
alias summarize_pull-requests='fabric --pattern summarize_pull-requests'
alias extract_article_wisdom='fabric --pattern extract_article_wisdom'
alias extract_poc='fabric --pattern extract_poc'
alias ai='fabric --pattern ai'
alias analyze_threat_report_trends='fabric --pattern analyze_threat_report_trends'
alias create_threat_model='fabric --pattern create_threat_model'
alias extract_references='fabric --pattern extract_references'
alias summarize_micro='fabric --pattern summarize_micro'
alias extract_videoid='fabric --pattern extract_videoid'
alias create_video_chapters='fabric --pattern create_video_chapters'
alias analyze_spiritual_text='fabric --pattern analyze_spiritual_text'
alias summarize_git_changes='fabric --pattern summarize_git_changes'
alias rate_value='fabric --pattern rate_value'
alias philocapsulate='fabric --pattern philocapsulate'
alias check_agreement='fabric --pattern check_agreement'
alias compare_and_contrast='fabric --pattern compare_and_contrast'
