#!/usr/bin/env bash

# Get the current path since it is called from a forked process.
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

exec > $DIR/logs/log 2>&1

echo "--------------------------------------------"
echo "Triggered: $(date)"

if [ $1 == 'open' ];
then
  echo "Deployment ready."
fi

if [ $1 == 'push' ];
then
  echo "Starting deployment."
  # cd  SOME/PROJECT
  # git pull - maybe you want some rules around this. Like most recent tag?
  # -- project build --
  # -- copy the files up to production in a safe directory --
  # -- swap the old web root with the new one --
  # -- run any update scripts that you might want
  echo "Complete: $(date) "
fi

if [ "$1" == 'close' ];
then
  echo "Deployment closed."
fi

echo "-------------------------------------------"
