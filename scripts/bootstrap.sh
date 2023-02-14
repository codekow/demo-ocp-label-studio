#!/bin/bash
#set -e

usage(){
echo "
You can run individual functions!

example:
  setup_demo
"
}

is_sourced() {
  if [ -n "$ZSH_VERSION" ]; then 
      case $ZSH_EVAL_CONTEXT in *:file:*) return 0;; esac
  else  # Add additional POSIX-compatible shell names here, if needed.
      case ${0##*/} in dash|-dash|bash|-bash|ksh|-ksh|sh|-sh) return 0;; esac
  fi
  return 1  # NOT sourced.
}

setup_venv(){
  python3 -m venv venv
  source venv/bin/activate
  pip install -q -U pip

  check_venv || usage
}

check_venv(){
  # activate python venv
  [ -d venv ] && . venv/bin/activate || setup_venv
}

setup_pip(){
  pip install -qr requirements.txt
}

print_info(){
  echo "
  Run the following:

  # activate python virtual env (bash)
  source venv/bin/activate

  # start label-studio
  label-studio
  "
}

setup_demo(){
  check_venv
  setup_pip
  print_info
}

is_sourced && usage || setup_demo
