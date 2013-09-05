#!/bin/sh

files=`mdfind -onlyin ~/iz "$*"`

for file in $files; do
  grep -H -I "$*" $file
done
