#
#
#
#
#

__git_ls_branch () {

  for file in `ls`
  do
    if [ -d $file ]
    then
      cd $file
      ps1=`__git_ps1`
      printf "%-30s %15s\n" "$file" "$ps1"
      cd ..
    else
      printf "%-30s\n" "$file"
    fi
  done

}
