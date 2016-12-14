esc="\e"

blackf="${esc}[30m";   redf="${esc}[31m";    greenf="${esc}[32m"
yellowf="${esc}[33m"   bluef="${esc}[34m";   purplef="${esc}[35m"
cyanf="${esc}[36m";    whitef="${esc}[37m"
blackb="${esc}[40m";   redb="${esc}[41m";    greenb="${esc}[42m"
yellowb="${esc}[43m"   blueb="${esc}[44m";   purpleb="${esc}[45m"
cyanb="${esc}[46m";    whiteb="${esc}[47m"
boldon="${esc}[1m";    boldoff="${esc}[22m"
italicson="${esc}[3m"; italicsoff="${esc}[23m"
ulon="${esc}[4m";      uloff="${esc}[24m"
invon="${esc}[7m";     invoff="${esc}[27m"

bluegreen="${esc}[38;5;49m";	    darkpurple="${esc}[38;5;54m"
bluegreenb="${esc}[40;38;5;49m";    darkpurpleb="${esc}[40;38;5;54m"
greyb="${esc}[40;38;5;233m"

reset="${esc}[0m"

PS1="\[${reset}\][ \@ ] \[${invon}\]\[${bluegreen}\]\h::\u\[${reset}\]"
PS1="${PS1} :: \[${bluegreen}\]\w\[${reset}\]\n\[${whitef}\]>\[${reset}\] "
export PS1
