alias eb="vim ~/.bashrc"
alias rb="source ~/.bashrc"

alias ls='ls -F --group-directories-first'
alias ll='ls -AlhFt --color=never'

alias dfind='find ./ -maxdepth 1 -type d \! -regex '^\.\/$''
alias ffind='find ./ -maxdepth 1 -type f'

alias cls='clear'
alias xx='exit'

alias cpa='cp -a'
alias ssp='sudo ss -tulpn'

alias v='vim'

alias sctl='systemctl'
alias sctlfi='systemctl list-unit-files'
alias jctl='journalctl'
alias off='systemctl poweroff'
alias reboots='systemctl restart'

alias gs='git status'
alias ga='git add ./*'
alias gpush='git push -u origin master'

alias pupg='python -m pip install --upgrade pip'
