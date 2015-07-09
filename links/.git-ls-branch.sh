#
#
#
#
#

__git_ls_branch () {

  for item in `ls`
  do
    if [ -d $item ] && [ -d $item/.git ]
    then
      cd $item
      ps1=`__git_ps1`
      printf "%-40s %25s\n" "$item" "$ps1"
      cd ..
    else
      printf "%-30s\n" "$item"
    fi
  done

}
