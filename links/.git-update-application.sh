#
#
#
#
#

__git_update_application () {
  # Process arguments
  target_branch="develop"
  local OPTIND
  while getopts ":t:" flag
  do
    case $flag in
      t)
        target_branch=$OPTARG
        ;;
      \?)
        echo "hmm"
        ;;
    esac
  done

  # Iterate over directory
  for item in `ls`
  do
    if [ -d $item ] && [ -d $item/.git ]
    then
      cd $item

      git fetch --quiet

      $(git diff-index --quiet HEAD)
      if [ $? == 1 ]
      then
        echo "$item is DIRTY"
      else
        current_branch=$(git name-rev --name-only HEAD)
        case $current_branch in
          "develop")
            echo "running develop already"
            ;;
          \?)
            echo "switching to develop"
            git checkout develop --quiet
            ;;
        esac
        git pull --quiet
        echo "$item is now running develop from $current_branch"
      fi

      cd ..
    fi
  done

  __git_ls_application

}

__git_ls_application () {

  for item in `ls`
  do
    if [ -d $item ] && [ -d $item/.git ]
    then
      cd $item
      ps1=`__git_ps1`
      printf "%-30s %30s\n" "$item" "$ps1"
      cd ..
    else
      printf "%-30s\n" "$item"
    fi
  done

}
