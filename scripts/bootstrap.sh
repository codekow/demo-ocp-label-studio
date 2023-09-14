#!/bin/bash
#set -e

usage(){
echo "
You can run individual functions!

options:
  local_demo
  openshift_demo
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

install_reqs(){
  pip install -r requirements.txt
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

openshift_demo(){
  oc apply -k components/demo
}

setup_app(){
  APP_USER=user@localhost
  APP_PASS=password
  
  export LABEL_STUDIO_BASE_DATA_DIR=$(pwd)/scratch/label-studio
  export LABEL_STUDIO_LOCAL_FILES_SERVING_ENABLED=true
  export LABEL_STUDIO_LOCAL_FILES_DOCUMENT_ROOT=$(pwd)/scratch
  
  [ -e "${LABEL_STUDIO_BASE_DATA_DIR}" ] || mkdir -p "${LABEL_STUDIO_BASE_DATA_DIR}"
  [ -e "${LABEL_STUDIO_LOCAL_FILES_DOCUMENT_ROOT}" ] || mkdir -p "${LABEL_STUDIO_LOCAL_FILES_DOCUMENT_ROOT}"

  # initalize app config
  [ ! -e "${LABEL_STUDIO_BASE_DATA_DIR}/label_studio.sqlite3" ] && \
    label-studio init --username "${APP_USER}" --password "${APP_PASS}"
  
  label-studio reset_password --username "${APP_USER}" --password "${APP_PASS}"
  echo "APP_USER: ${APP_USER}"
  echo "APP_PASS: ${APP_PASS}"
  sleep 3

  label-studio start
}

local_demo(){
  check_venv
  install_reqs
  setup_app
  print_info
}

is_sourced && usage || local_demo
