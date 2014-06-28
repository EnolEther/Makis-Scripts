#####################
# Normal env config #
#####################

# PS1='\u:\W\>'
PS1='\$\[\e[32;40m\]\u\[\e[0m\]:\W>';

# aliases to make my life easier
. ~/.alias-bash


# Setting up enviormental paths
export PATH=/usr/local/bin:$PATH;
export PATH=$HOME/.rbenv/bin:$PATH;
export RBENV_ROOT=/usr/local/var/rbenv;
eval "$(rbenv init -)";
# export PATH=$PATH:/Applications/Mathematica.app/Contents/MacOS;
export PATH=$PATH:/.mybin;
export PATH=$PATH:/usr/texbin;

source `brew --repository`/Library/Contributions/brew_bash_completion.sh
# export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin
