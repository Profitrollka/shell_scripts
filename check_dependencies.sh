#!/usr/bin/env bash

# Exit if any subcommand fails
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NO_COLOR='\033[0m'
CLEAR_LINE='\r\033[K'

printf "[1/2]🔎   checking dependencies"

if ! command -v python3 > /dev/null; then
  printf "${CLEAR_LINE}💀${RED}   You must install python3 on your system before setup can continue${NO_COLOR}\n"
  printf "ℹ️   On macOS🍎 you should 'brew install python@3.9'\n"
  exit -1
fi

if [[ $(python3 --version) < "3.9" ]]; then
  printf "${CLEAR_LINE}⚠️${YELLOW}   You are not using a known working version of python3.${NO_COLOR}\n"
  printf "ℹ️   This might not be a problem but if you're having issues, try installing 3.9\n"
  printf "[1/2]🔎   checked dependencies"
fi

printf "[2/2]🔎   checking dependencies"

if ! command -v psql > /dev/null; then
  printf "${CLEAR_LINE}💀${RED}   You must install postgresql on your system before setup can continue${NO_COLOR}\n"
  printf "ℹ️   On macOS🍎 you should 'brew install postgresql@14.2'\n"
  exit -1
fi

if [[ $(psql --version) < "14.2" ]]; then
  printf "${CLEAR_LINE}⚠️${YELLOW}   You are not using a known working version of postgresql.${NO_COLOR}\n"
  printf "ℹ️   This might not be a problem but if you're having issues, try installing 14.2\n"
  printf "[2/2]🔎   checked dependencies"
fi
