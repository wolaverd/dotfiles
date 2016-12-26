# Dotfiles
alias eb="vim ~/.bashrc"
alias rb="source ~/.bashrc"

# Core
alias ls='ls -F --group-directories-first'
alias ll='ls -AlhFt --color=never'
alias dfind='find ./ -maxdepth 1 -type d \! -regex '^\.\/$''
alias ffind='find ./ -maxdepth 1 -type f'
alias cls='clear'
alias xx='exit'
alias cpa='cp -a'

# Network
alias ssp='sudo ss -tulpn'

# Editor
alias v='vim'
alias s='subl'

# Systemd
alias sctl='systemctl'
alias sctlfi='systemctl list-unit-files'
alias jctl='journalctl'
alias off='systemctl poweroff'
alias reboots='systemctl restart'

# Git
alias gs='git status'
alias ga='git add ./*'
alias gpush='git push -u origin master'

alias glog='git log --graph --oneline --decorate --all'

# Python
alias pupg='python -m pip install --upgrade pip'
