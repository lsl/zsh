alias ducks='du -cksh * | sort -rn | head -11'
alias duck='du -cks * | sort -rn | head -11'
alias hist='history -i'
alias tophist="\history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
alias date='date "+%Y-%m-%d %A    %T %Z"'
alias genpass='LC_CTYPE=C tr -dc A-Za-z0-9_\@\$\%\^\&\(\)= < /dev/urandom | head -c 32 | xargs'
alias v='vim'
alias vi='vim'
alias ls='ls -F --color=always'
alias la='ls -alhF --color=always'
alias sl='ls'
alias l='ls'
alias s='ls'
alias les='less'
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias openports='netstat -nape --inet'
alias ns='netstat -alnp --protocol=inet | grep -v CLOSE_WAIT | cut -c-6,21-94 | tail +2'
alias ping='ping -c 3'
alias watch='watch -n 1 "$@"'
