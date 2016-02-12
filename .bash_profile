# set PATH so it includes user's private bin if it exists
if [ -d ~/Bin ] ; then
    PATH=~/Bin:"${PATH}"
fi

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '

alias ls='ls -G'

export RACKET_HOME=/Applications/Racket\ v6.2/bin
PATH=$PATH::$RACKET_HOME

export PATH

alias p='cd ~/Projects'
alias d='cd ~/Dropbox'

CONFREPO="$HOME/.config-repo"

alias config='/usr/bin/git --git-dir=$CONFREPO/ --work-tree=$HOME'

if [ ! -d "$CONFREPO" ]; then
    echo "Initializing $CONFREPO"
    git init --bare $CONFREPO
    config config status.showUntrackedFiles no
fi

VIRTUALENVWRAPPER=/usr/local/bin/virtualenvwrapper.sh
if [ -d "$VIRTUALENVWRAPPER" ]; then
    source $VIRTUALENVWRAPPER
fi
