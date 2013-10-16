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
      printf "%15s %15s" $file $ps1
      cd ..
    else
      printf "%15s" $file
    fi
  done

}
