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
      echo "$file $ps1"
      cd ..
    else
      echo "$file"
    fi
  done

}
