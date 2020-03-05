#!/bin/sh

if [ ! -e /.dockerenv ]; then
  echo "This script works only on docker container."
  exit 1
fi

export PATH="$HOME/.local/bin:$PATH"
echo "set bell-style none" > ~/.inputrc
echo "set visualbell t_vb=" > ~/.vimrc
echo "PS1='\[\e]0;\u@demo: \w\a\]\[\033[01;32m\]\u@demo\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" > ~/.bash_aliases

run() {
  echo
  echo "$ $*"
  eval "$*"
}

if ! type shellspec >/dev/null 2>&1; then
  run "curl -fsSL https://git.io/shellspec | sh -s master -y"
fi
type tree >/dev/null 2>&1 && run tree

exec bash -l
