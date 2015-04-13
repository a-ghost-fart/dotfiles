# oh-my-zsh config guff
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git mvn puppet node npm)

# apt doesn't have a decent version of maven so manually install it
export MVN_HOME="/usr/local/apache-maven-3.2.5/"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$MVN_HOME/bin"
source $ZSH/oh-my-zsh.sh

# irc server alias
alias irc="ssh irc -t 'screen -r'"

# Actually...
cowsay -d "Actually it's about ethics in terminal emulation."
