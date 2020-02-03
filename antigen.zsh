source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

source $SHELL_CONF/powerlevel9kconfig.zsh

antigen bundle git
antigen bundle pip
antigen bundle python
antigen bundle docker
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions src

#A theme from oh-my-zsh
#Visit https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#and https://github.com/robbyrussell/oh-my-zsh/wiki/External-themes
#to find plenty of alternative themes
antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply
antigen selfupdate
