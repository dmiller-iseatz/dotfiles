export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
source ~/.nvm/nvm.sh

# DEVIN'S PERSONAL AWESOMEPROMPT(tm) with DOUG'S AWESOMEREADIBILITY(tm)

# Outputs the current branch if in a git repository
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_UNTRACKEDFILES=true

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
Git_Color=$(get_color "1;36m")
Path_Color=$(get_color "1;33m")
UID_Color=$(get_color "1;37m")

PROMPT_COMMAND="__git_ps1 '\n\[\e[0;34m\]┌[$User_Color\u$Frame_Color]─[$Path_Color\w$Frame_Color]─[$Git_Color' '$Frame_Color]\n\[\e[0;34m\]└[$UID_Color\$$Frame_Color]› $Reset_Color' '%s'"

# Colorized ls
alias ls='ls -G'

# git autocompletions
source ~/git-completion.bash

# Ruby assistance
alias be='bundle exec'
alias bi='bundle install'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
if [ -f ~/.bashrc ]; then source ~/.bashrc; fi
