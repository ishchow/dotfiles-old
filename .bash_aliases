#### sudo ####
alias sudo='sudo '

#### git ####
# git fetch
alias gf='git fetch'
# git status
alias gs='git status'
# git branch
alias gbr='git branch'
alias gbrd='git branch -d'
alias gbrD='git branch -D'
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
alias grbom='git fetch && git rebase origin/master'
alias grbi='git rebase -i --autosquash'
alias grbioh='git rebase -i --autosquash origin HEAD'
alias grbiob='git rebase -i --autosquash origin/$(git branch --show-current)'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
# git submodule
alias gsuir='git submodule update --init --recursive'
alias gsu='git submodule update'
# git push
alias gpu='git push'
alias gpuoh='git push -u origin HEAD'
function gpucob {
    git push origin $1:$(git branch --show-current)
}
# git pull
alias gpl='git pull'
alias gplom='git pull origin master'
# git add
alias ga='git add'
alias gau='git add -u'
alias gad='git add .'
# git reset
alias grs='git reset'
alias grsh='git reset --hard'
alias grshoh='git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'
# git log
alias gl='git log --oneline --decorate'
# git revert
alias grv='git revert'
alias grvnc='git revert --no-commit'
# git clean
alias gcl='git clean'
alias gclnfd='git clean -nfd'
alias gclfd='git clean -fd'
alias gclnf='git clean -nf'
alias gclf='git clean -f'
# git diff
alias gdf='git diff'
alias gdfh='git diff HEAD'
alias gdfom='git diff origin/master'
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
alias cdgroot='cd $(git rev-parse --show-toplevel)'

##### zypper ####
alias zin='zypper in'
alias zrm='zypper rm'
alias zse='zypper se'
alias zdup='zypper dup'
alias zar='zypper ar'
alias zrr='zypper rr'
alias zref='zypper ref'

#### cat ####
alias cat='bat'

#### lazygit ####
alias lg='lazygit'
