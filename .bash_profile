reset='\e[0m'
green='\e[0;31m'
yellow='\e[0;33m'

# Command prompt
export CLICOLOR=1
export PS1='\w$(__git_ps1 " \[$yellow\](%s)\[$reset\]") $ '

alias ll="ls -alh"

# Bash profile editing
alias cbp="code ~/.bash_profile"
alias sbp="source ~/.bash_profile"

export PATH=$PATH:/usr/local/go/bin
# export GOPATH=$GOPARTH:/home/kevin/strike/goproj


#=================================================================
#  Git
#=================================================================

get_git_branch() {
  echo `git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
}

# Git aliases
alias gs="git status"
alias co="git checkout"

gc() {
	git commit -S -m"$1"
}

alias co="git checkout"
alias com="git checkout master"

pl() {
  BRANCH=${1:-`get_git_branch`}
  echo "pulling from $BRANCH"
  git pull -S origin $BRANCH
}

alias plm="pl master"

psh() {
  BRANCH=${1:-`get_git_branch`}
  echo "pushing to $BRANCH"
  git push origin $BRANCH	
}

sco() {
	git stash
	git checkout $1
}

commit() {
	git commit -S -m"$1"
}

alias spop="git stash pop"

#=================================================================
# Strike
#=================================================================

source ~/strike/bin/bastion.sh
# terraform -install-autocomplete
alias tf="terraform"
alias tfa="terraform apply -auto-approve"
alias tfd="terraform destroy -auto-approve"

alias kc="HTTPS_PROXY=localhost:8888 kubectl"
export INPUTRC=~/.inputrc
