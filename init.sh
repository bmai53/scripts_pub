# Add the following to bash config (preserve order):

# export SCRIPTS_DIR="<path to this dir>"
# source <path to this dir>/init.sh

# this works on macos but not wsl
SCRIPTS_DIR="$(dirname "$BASH_SOURCE")/"

# GIT STUFF
GIT_HELP_STRING(){
  echo "
    ga:     git add
    gb:     git branch
    gbd:    $SCRIPTS_DIR/git-branch-delete.sh
    gc:     git commit -m
    gco:    git checkout
    gcom:   git checkout master
    gcomp:  git checkout master && git pull
    gmm:    $SCRIPTS_DIR/git-merge-master.sh
    gpo:    $SCRIPTS_DIR/git-push-origin.sh
    gs:     git status
    gst:    $SCRIPTS_DIR/git-stash.sh
  "
}

alias ga="git add"
alias gb="git branch"
alias gbd="$SCRIPTS_DIR/git-branch-delete.sh"
alias gc="$SCRIPTS_DIR/git-commit.sh"
alias gco="git checkout"
alias gcom="git checkout master"
alias gcomp="git checkout master && git pull"
alias gmm="$SCRIPTS_DIR/git-merge-master.sh"
alias gpo="$SCRIPTS_DIR/git-push-origin.sh"
alias gs="git status"
alias gst="$SCRIPTS_DIR/git-stash.sh"
alias ghelp=GIT_HELP_STRING

# brew rename
# alias brew86="arch -x86_64 /usr/local/homebrew/bin/brew" 
# alias brewARM="/opt/homebrew/bin/brew"

# dir alias
alias cddl="cd ~/Downloads"
alias cdd="cd ~/dev"
alias cdx="cd $SCRIPTS_DIR"
alias cdw="cd ~/workplace/"
alias cdh="cd ~"

# downloads alias
alias dl="$HOME/Downloads"

#killport alias
alias killport="$SCRIPTS_DIR/killport.sh"
