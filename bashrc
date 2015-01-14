
export PATH=~/bin:~/homestash/bin:/usr/local/bin:$PATH

#export EDITOR='subl -w'

export JAVA_HOME=`/usr/libexec/java_home`
alias usejava7="export JAVA_HOME=`/usr/libexec/java_home -v 1.7`"
alias usejava8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`"

#export MAVEN_OPTS="-XX:MaxPermSize=256m -Xmx512m"
export MAVEN_OPTS="-Xmx512m"

##export SVN_EDITOR=mate

alias d="ls -laFG"
alias ls="ls -FG"
##alias git="/usr/local/git/bin/git"


#### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"


#export MARKPATH=$HOME/.marks
#function jump { 
#    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
#}
#function mark { 
#    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
#}
#function unmark { 
#    rm -i "$MARKPATH/$1"
#}
#function marks {
#    \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
#}

#_completemarks() {
#  local curw=${COMP_WORDS[COMP_CWORD]}
#  local wordlist=$(gfind $MARKPATH -type l -printf "%f\n")
#  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
#  return 0
#}

#complete -F _completemarks jump unmark


#### Git autocomplete
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-extras
source /usr/local/etc/bash_completion.d/git-prompt.sh

source `brew --repository`/Library/Contributions/brew_bash_completion.sh


##export PS1="[\u@\h:\w]\$ "
# OLD MAC export PS1='[\[$(tput setaf 2)\]\u\[$(tput sgr0)\]@\[$(tput setaf 3)\]\h\[$(tput sgr0)\]: \[$(tput setaf 4 sgr0)\]\w\[$(tput setaf 6)\]`if [ "$(vcprompt)" != "" ]; then echo " $(vcprompt)"; fi`\[$(tput sgr0)\]]\n\$ '
# OLD CYG export PS1='\[\e]0;\w\a\]\n[\[\e[32m\]\u@\h: \[\e[33m\]\w \[\e[36m\]$(vcprompt)\[\e[0m\]]\n\$ '
# TORGEIR export PS1='\n\[$(tput setaf 2)\]\u\[$(tput sgr0)\]@\[$(tput setaf 1)\]\h \[$(tput setaf 3)\][`jobs -s | wc -l | sed -e "s/ //g"`] \[$(tput setaf 4 sgr0)\]\w\[$(tput setaf 5)\]`__git_prompt` \n\[$(tput sgr0)\]$ '
export PS1='\n[\[$(tput setaf 2)\]\u\[$(tput sgr0)\]@\[$(tput setaf 1)\]\h \[$(tput setaf 3)\][`jobs -s | wc -l | sed -e "s/ //g"`] \[$(tput setaf 5 sgr0)\]\w\[$(tput setaf 6)\]`__git_ps1`\[$(tput sgr0)\] ]\n$ '

# source project specific rc if it exists
if [ -f "${HOME}/.projectrc" ] ; then
  source "${HOME}/.projectrc"
fi
# source user specific rc if it exists
if [ -f "${HOME}/.personalrc" ] ; then
  source "${HOME}/.personalrc"
fi
