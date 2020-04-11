PATH=$PATH:/Applications/Racket\ v7.5/bin

export PS1="\u@\h \w $ "
export 
export PHYSICELL_CPP=g++-9

# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH

alias ls='ls -G'
alias ll='ls -lhG'
export PS1="\[\033[38;5;51m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\]\[\033[38;5;226m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\\$\[$(tput sgr0)\] "
export EDITOR='vim'

