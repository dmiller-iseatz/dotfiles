export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# DEVIN'S PERSONAL AWESOMEPROMPT(tm) with DOUG'S AWESOMEREADIBILITY(tm)

function get_color {
     echo $ResetColor"\[\e["$1"\]"
}

# Color codes

# Black       0;30     Dark Gray     1;30
# Blue        0;34     Light Blue    1;34
# Green       0;32     Light Green   1;32
# Cyan        0;36     Light Cyan    1;36
# Red         0;31     Light Red     1;31
# Purple      0;35     Light Purple  1;35
# Brown       0;33     Yellow        1;33
# Light Gray  0;37     White         1;37

Reset_Color="\[\e[0m\]"
Frame_Color=$(get_color "0;34m")
User_Color=$(get_color "0;33m")
At_Color=$(get_color "1;30m")
Host_Color=$(get_color "0;33m")
Time_Color=$(get_color "1;36m")
Path_Color=$(get_color "1;33m")
UID_Color=$(get_color "1;37m")


# PS1="\n$Frame_Color┌[$User_Color\u$At_Color@$Host_Color\h$Frame_Color]─[$Path_Color\w$Frame_Color]─[$Time_Color\@$Frame_Color]\n└[$UID_Color\$$Frame_Color]› $Reset_Color"

# Removed the machine's hostname because it's dumb on this computer.
# Opening frame color variable isn't working for some reason, so it is hard coded;
PS1="\n\[\e[0;34m\]┌[$User_Color\u$Frame_Color]─[$Path_Color\w$Frame_Color]─[$Time_Color\@$Frame_Color]\n\[\e[0;34m\]└[$UID_Color\$$Frame_Color]› $Reset_Color"


# Colorized ls
alias ls='ls -G'

# Rails aliases
alias be='bundle exec'

# git autocompletions
source ~/git-completion.bash

# mvim alias
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
