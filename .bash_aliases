#### sudo ####
alias sudo='sudo '

#### git ####
# git status
alias gs="git status"
# git checkout
alias gco="git checkout"
alias gcob="git checkout -b"
# git branch
alias gbr="git branch"
alias gbrd="git branch -d"
alias gbrD="git branch -D"
# git commit 
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gcf="git commit --fixup"
# git rebase
alias grb="git rebase"
alias grbi="git rebase -i --autosquash"
alias grbioh="git rebase -i --autosquash origin/$(git rev-parse --abbrev-ref HEAD)"
alias rebom="git checkout master && git pull && git checkout - && git rebase master"
# git submodule
alias gsuir="git submodule update --init --recursive"
# git push
alias gpu="git push"
alias gpuoh="git push -u origin HEAD"
# git pull
alias gpl="git pull"
# git add
alias ga="git add"
alias gau="git add -u"
alias gad="git add ."
# git reset
alias grs="git reset"
alias grsh="git reset --hard"
# git log
alias gl="git log --oneline --decorate"
# git revert
alias grv="git revert"
# git clean
alias gcl="git clean"
alias gclnfd="git clean -nfd"
alias gclfd="git clean -fd"
alias gclnf="git clean -nf"
alias gclf="git clean -f"
# move to root
alias groot="git rev-parse --show-toplevel"
alias cdgroot="cd $(git rev-parse --show-toplevel)"

##### zypper ####
alias zin="zypper in"
alias zrm="zypper rm"
alias zse="zypper se"
alias zdup="zypper dup"
alias zar="zypper ar"
alias zrr="zypper rr"
alias zref="zypper ref"

#### cat ####
alias cat="bat"
