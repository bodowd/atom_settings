
# changing terminal display
export PS1="Bing \w \e[0;31m$ \e[m " # begin color code \e[ColorCodem ... \e[m   ends color code

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

#Aliases
alias ll='ls -l'
alias la='ls -la'
alias jp='jupyter notebook'
alias up='cd ..'

#alias tmux='tmux -2'


#exercism.io CLI
export PATH=~/bin:$PATH

# added by Anaconda3 4.1.1 installer
export PATH="/Users/Bing/anaconda3/bin:$PATH"
