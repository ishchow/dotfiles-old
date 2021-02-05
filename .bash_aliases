#### sudo ####
alias sudo='sudo '


#### git ####
# git
alias g='git'
# git fetch
alias gf='git fetch'
# git status
alias gs='git status'
# git branch
function gbrdef() {
    # Get default branch for remote
    origin_name=${1:-origin}
    git remote show $origin_name | grep "HEAD branch" | sed 's/.* //'
}
alias gbr='git branch'
alias gbrd='git branch -d'
alias gbrD='git branch -D'
function gbrp() {
    git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
}
# git commit 
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcf='git commit --fixup'
# git checkout
alias gco='git checkout'
alias gcob='git checkout -b'
# git rebase
alias grb='git rebase'
alias grbom='git fetch && git rebase origin/$(gbrdef)'
alias grbi='git rebase -i --autosquash'
alias grbioh='grbi origin HEAD'
alias grbiob='grbi origin/$(git branch --show-current)'
alias grbimbom='grbi $(gmbom)'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
# git submodule
alias gsu='git submodule update'
alias gsuir='git submodule update --init --recursive'
# git push
alias gpu='git push'
alias gpuoh='git push -u origin HEAD'
function gpucob {
    if [[ $# -eq 0 ]]; then
        echo "No arguments passed"
        return
    fi
    git push origin $1:refs/heads/$(git branch --show-current)
}
function gpufcob {
    if [[ $# -eq 0 ]]; then
        echo "No arguments passed"
        return
    fi
    git push --force origin $1:refs/heads/$(git branch --show-current)
}
# git merge
alias gm='git merge'
# git merge-base
alias gmb='git merge-base'
alias gmbom='gmb HEAD origin/$(gbrdef)' 
# git pull
alias gpl='git pull'
alias gplom='git pull origin $(gbrdef)'
# git add
alias ga='git add'
alias gaa='git add -A'
alias gau='git add -u'
alias gad='git add .'
# git reset
alias grs='git reset'
alias grsh='git reset --hard'
alias grshoh='git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'
# git log
alias gl='git log --oneline --decorate'
# git restore
alias gro='git restore'
alias gros='git restore --staged'
# git revert
alias grv='git revert'
alias grvnc='git revert --no-commit'
# git clean
alias gcl='git clean'
alias gclnfd='git clean -nfd'
alias gclfd='git clean -fd'
alias gclnf='git clean -nf'
alias gclf='git clean -f'
alias gclfdx='git clean -fdx'
# git diff
alias gdf='git diff'
alias gdfh='git diff HEAD'
alias gdfom='git diff origin/$(gbrdef)'
alias gdfoh='git diff origin/HEAD'
# git cherry-pick
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
# git reflog
alias grfl='git reflog'
# git stash
alias gst='git stash'
alias gsta='git stash apply'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'
# move to root
alias groot='git rev-parse --show-toplevel'
alias cdgroot='cd $(groot)'


##### zypper ####
alias zin='zypper in'
alias zrm='zypper rm'
alias zse='zypper se'
alias zdup='zypper dup'
alias zar='zypper ar'
alias zrr='zypper rr'
alias zref='zypper ref'
alias zsysup='sudo zypper ref && sudo zypper dup'


#### tmux ####
alias tmls='tmux ls'
alias tmas='tmux attach-session -t'
alias tmks='tmux kill-session -t'


#### todo ####
alias t='todo.sh'
alias td='todo.sh do'
alias ta='todo.sh a'
alias tap='todo.sh append'
alias tav='todo.sh archive'
alias tls='todo.sh ls'
alias tlsa='todo.sh lsa'
alias tlsc='todo.sh lsc'
alias tlsp='todo.sh lsp'
alias tlsprj='todo.sh lsprj'
alias trm='todo.sh rm'


#### cat ####
alias cat='bat'


#### lazygit ####
alias lg='lazygit'
