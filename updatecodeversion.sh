#!/bin/bash
# Prime the environment so we don't talk nonsense
git fetch

if [ "$1" == '' ]
then
  echo 'You have to specify a git version number to deploy.'
  echo "$0 <version>"
  echo "Your options for deployment are:"
  git tag -l
  exit 1
fi

GITTAGS=$(git tag -l)
echo $GITTAGS | grep -q $1
if [ $? -eq 0 ]
then
  echo -e "Starting GIT checkout of ${1}\n"
  git checkout $1
  echo -e "\n Finished with GIT\n"
  echo "Calling r10k to deploy modules"
  r10k puppetfile install -v
  echo -e "\n Finished with r10k module deployment\n"
else
  echo -e "\"${1}\" does not exist in this repo"
  echo "Your options for deployment are:"
  git tag -l
fi
