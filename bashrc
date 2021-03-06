##export PS1="[\u@\h:\w]\$ "
# OLD MAC export PS1='[\[$(tput setaf 2)\]\u\[$(tput sgr0)\]@\[$(tput setaf 3)\]\h\[$(tput sgr0)\]: \[$(tput setaf 4 sgr0)\]\w\[$(tput setaf 6)\]`if [ "$(vcprompt)" != "" ]; then echo " $(vcprompt)"; fi`\[$(tput sgr0)\]]\n\$ '
# OLD CYG export PS1='\[\e]0;\w\a\]\n[\[\e[32m\]\u@\h: \[\e[33m\]\w \[\e[36m\]$(vcprompt)\[\e[0m\]]\n\$ '
# TORGEIR export PS1='\n\[$(tput setaf 2)\]\u\[$(tput sgr0)\]@\[$(tput setaf 1)\]\h \[$(tput setaf 3)\][`jobs -s | wc -l | sed -e "s/ //g"`] \[$(tput setaf 4 sgr0)\]\w\[$(tput setaf 5)\]`__git_prompt` \n\[$(tput sgr0)\]$ '
export PS1='\n[\[$(tput setaf 2)\]\u\[$(tput sgr0)\]@\[$(tput setaf 1)\]\h \[$(tput setaf 5)\][`jobs -r | wc -l | sed -e "s/ //g"`] \[$(tput setaf 3 sgr0)\]\w\[$(tput setaf 6)\]`__git_ps1`\[$(tput sgr0)\] ]\n$ '

function iscygwin {
  if [[ "`uname`" == "CYGWIN"* ]]; then
    return 0
  else
    return 1
  fi
}

export MAVEN_OPTS="-Xmx512m"
export PATH=~/bin:~/homestash/bin:/usr/local/bin:$PATH

GPG_TTY=$(tty)
export GPG_TTY

alias cls="clear"

alias bd="boot2docker"

alias whence='type -a'
alias grep='grep --color'

alias usemvnbare="rm -fv ~/.m2/settings.xml"

function sshagent {
  SSHAGENT="/usr/bin/ssh-agent"
  SSHAGENTARGS="-s"
  if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
    echo "Starting ssh-agent for current shell"
    eval `$SSHAGENT $SSHAGENTARGS`
    trap "kill $SSH_AGENT_PID" 0
  fi
}
function addkey {
  sshagent
  if [ -z ${1+x} ]; then
    ssh-add ~/.ssh/id_rsa
  else
    ssh-add $1
  fi
}

if [[ "`uname`" == "CYGWIN"* ]]; then
  export LANG=$(locale -uU)
  export FIND_CMD="find"

  export VISUAL=vim

  # If not running interactively, don't do anything
  [[ "$-" != *i* ]] && return

  # DEFAULT CYG export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$'
  # OLD CYG export PS1='\[\e]0;\w\a\]\n[\[\e[32m\]\u@\h: \[\e[33m\]\w \[\e[36m\]$(vcprompt)\[\e[0m\]]\n\$ '
  #export PS1='\[\e]0;\w\a\]\n[\[\e[32m\]\u\[\e[0m\]@\[\e[32m\]\h: \[\e[33m\]\w\[\e[36m\]`__git_ps1`\[\e[0m\] ]\n$ '

  alias d="ls -laF --color=auto"
  alias ls="ls -F --color=auto"
  alias sh=bash

  alias npp="/cygdrive/c/Program\ Files\ \(x86\)/Notepad++/notepad++.exe"
  #alias findes="netstat -ano | grep 9200"
  #alias killes="taskkill /F /PID "

  alias vi=vim

  [[ -f /etc/bash_completion ]] && . /etc/bash_completion
  # OLD source /etc/bash_completion.d/git
  source /usr/share/bash-completion/completions/git
  source ~/bin/git-prompt.sh

  function findes() {
    netstat -ano | grep LISTENING | grep :${1:-9200}
  }
  function killes() {
    if [ -z ${1+x} ]; then
      taskkill /F /PID $(netstat -ano | grep LISTENING | grep :9200 | awk 'NR==1 {print $NF}')
    else
      taskkill /F /PID $1
    fi
  }

  # ConEmu Title
  function cet() {
    ConEmuC -GuiMacro Rename 0 "$1"
  }

  #sshagent
else
  export JAVA_HOME=`/usr/libexec/java_home`
  alias usejava7="export JAVA_HOME=`/usr/libexec/java_home -v 1.7`"
  alias usejava8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`"

  alias d="ls -laFG"
  alias ls="ls -FG"

  export FIND_CMD="gfind"

  #### Git autocomplete
  source /usr/local/etc/bash_completion.d/git-completion.bash
  source /usr/local/etc/bash_completion.d/git-extras
  source /usr/local/etc/bash_completion.d/git-prompt.sh

  complete -C aws_completer aws

  #source $(brew --repository)/Library/Contributions/brew_bash_completion.sh
  source /usr/local/etc/bash_completion.d/brew

  export NVM_DIR="${HOME}/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi

if [[ ! -d "${HOME}/.vim/bundle/Vundle.vim" ]]; then
  echo "ViM plugin manager not found: cloning Vundle.vim"
  git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

export MARKPATH=$HOME/.marks
function jump {
  cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
  mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
  rm -i "$MARKPATH/$1"
}
function marks {
  \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}

_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$($FIND_CMD $MARKPATH -type l -printf "%f\n")
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}

complete -F _completemarks jump unmark

# source all config in project dir
# if [ -d "${HOME}/.project.d" ] ; then
#   for projectfile in ${HOME}/.project.d/*; do
#     echo "Sourcing $projectfile"
#     source $projectfile
#   done
# fi

# source project specific rc if it exists
if [ -f "${HOME}/.projectrc" ] ; then
  echo "Sourcing ${HOME}/.projectrc"
  source "${HOME}/.projectrc"
fi

# source all config in user dir
# if [ -d "${HOME}/.personal.d" ] ; then
#   for personalfile in ${HOME}/.personal.d/*; do
#     echo "Sourcing $personalfile"
#     source $personalfile
#   done
# fi

# source user specific rc if it exists
if [ -f "${HOME}/.personalrc" ] ; then
  echo "Sourcing ${HOME}/.personalrc"
  source "${HOME}/.personalrc"
fi

# source local computer specific rc if it exists
if [ -f "${HOME}/.localrc" ] ; then
  echo "Sourcing ${HOME}/.localrc"
  source "${HOME}/.localrc"
fi
