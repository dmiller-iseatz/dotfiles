export PATH="$HOME/.rbenv/bin:/usr/local/share/npm/bin:$PATH"
eval "$(rbenv init -)"

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


# Opening frame color variable isn't working for some reason, so it is hard coded;
#export PS1="\n\[\e[0;34m\]┌[$User_Color\u$Frame_Color]─[$Path_Color\w$Frame_Color]─[$Git_Color\$(__git_ps1 "%s")$Frame_Color]\n\[\e[0;34m\]└[$UID_Color\$$Frame_Color]› $Reset_Color"


# Colorized ls
alias ls='ls -G'

# git autocompletions
source ~/git-completion.bash

# mvim alias
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

#mdfind wrapper
alias sw='~/softwhere.sh'

#ls branch command
source ~/.git-ls-branch.sh
alias lsb='__git_ls_branch'
#psql -h 54.208.90.157 -U postgres simian_qa
alias ll='ls -l'

__bundle_exec_custom () {
  if [ -f Gemfile.local ]
  then
    BUNDLE_GEMFILE="Gemfile.local" bundle exec $@
  else
    bundle exec $@
  fi
}

__bundle_install_custom () {
  if [ -f Gemfile.local ]
  then
    BUNDLE_GEMFILE="Gemfile.local" bundle install $@
  else
    bundle exec $@
  fi
}

# Rails aliases
alias be='__bundle_exec_custom'
alias bi='__bundle_install_custom'
alias ber='rspec -c'

# torquebox
#export TORQUEBOX_HOME=~/torquebox-3.0.2
#export JBOSS_HOME=$TORQUEBOX_HOME/jboss
#export JRUBY_HOME=$TORQUEBOX_HOME/jruby
#export PATH=$JRUBY_HOME/bin:$PATH

# iZ api config
alias apilocal='qm -a reg -k api-http -v localhost:8888;qm -a unreg -k api-http -v amex-api-qa.iseatz.com:80'
alias apiqa='qm -a unreg -k api-http -v localhost:8888;qm -a reg -k api-http -v amex-api-qa.iseatz.com:80'
