
git_prompt() {
  # https://misc.flogisoft.com/bash/tip_colors_and_formatting
  normal="\033[0m\e[39m"
  black="\033[1m\e[30m"
  red="\033[1m\e[31m"
  green="\033[1m\e[32m"
  yellow="\033[1m\e[33m"
  blue="\033[1m\e[34m"
  magenta="\033[1m\e[35m"
  cyan="\033[1m\e[36m"
  white="\033[1m\e[97m"

  head=$(git_head)

  # Not in a git repo
  if [ -z "$head" ]; then
    echo "%{$red%}%n@%m%{$normal%} %{$blue%}%c%{$normal%} "
    return
  fi

  # Check status, yellow = dirty, red = conflict, green = clean
  if [ ! -z "$(exec git status -z --porcelain --ignore-submodules=dirty 2> /dev/null | tail -n1)" ]; then
    if [ ! -z "$(git ls-files -u 2> /dev/null)" ]; then
        color="%{$red%}"
    else
        color="%{$yellow%}"
    fi
  else
    color="%{$green%}"
  fi

  # user@hostname ~ master
  echo "%{$red%}%n@%m%{$normal%} %{$blue%}%c%{$normal%} $color$head%{$normal%} "
}

find-up () {
  local path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$1" ]]; do
      path=${path%/*}
  done
  echo "$path"
}

git_head() {
  local repo="$(find-up .git)"
  local head=""
  if [[ -f "$repo/.git/HEAD" ]]; then
    head=$(cat $repo/.git/HEAD)
    if [[ $head == "ref:"* ]]; then
      echo "${head/ref: refs\/heads\/}"
    else
      cut -c 1-9 $repo/.git/HEAD
    fi
  fi
}

PROMPT='$(exec git_prompt)'
