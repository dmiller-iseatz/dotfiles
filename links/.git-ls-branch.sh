#
#
#
#
#

__git_ls_branch () {

  for item in */
  do
    if [ -d $item ] && [ -d $item/.git ]
    then
      cd $item
      ps1=`__git_ps1`
      printf "%s %s\n" "$item" "$ps1"
      cd ..
    fi
  done | column -t

}
