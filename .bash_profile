export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '
export EDITOR=/usr/local/bin/emacsclient

ssh-add -A

alias ls='ls -G'
alias git-merge='git checkout master && git merge -'
alias git-push='git push origin HEAD'
alias git-undo='git reset HEAD~'
alias git-up='git checkout master && git pull && git checkout - && git rebase -i master && git push -f origin HEAD'
alias start-znc-tunnel="ssh -f -n -N -L 9999:localhost:9999 snake.quuux.org"
alias tmux-attach="tmux -CC attach"

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

source /usr/local/bin/virtualenvwrapper.sh

# Setup path
if [ -d ~/Bin ] ; then
    PATH="${PATH}:~/Bin"
fi

export PATH=$PATH:~/Library/Android/sdk/platform-tools/

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# set PATH so it includes user's private bin if it exists
if [ -d ~/Bin ] ; then
    PATH=~/Bin:"${PATH}"
fi

CONFREPO="$HOME/.config-repo"

alias config='/usr/bin/git --git-dir=$CONFREPO/ --work-tree=$HOME'

if [ ! -d "$CONFREPO" ]; then
    echo "Initializing $CONFREPO"
    git init --bare $CONFREPO
    config config status.showUntrackedFiles no
fi

