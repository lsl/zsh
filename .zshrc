#!/bin/zsh

export EDITOR='vim'
export VISUAL='vim'
export LESS="-R -x4 -X"
export HISTSTAMPS=yyyy-mm-dd
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
# required by zcompdump globbing below
setopt extendedglob
setopt auto_cd
setopt multios
setopt prompt_subst

# Load zgen
[ ! -d ~/.zgen ] && git clone https://github.com/tarjoilija/zgen.git ~/.zgen
ZGEN_AUTOLOAD_COMPINIT=0
source ~/.zgen/zgen.zsh

# If the init scipt doesn't exist
if ! zgen saved; then
  zgen oh-my-zsh lib/theme-and-appearance.zsh
  zgen oh-my-zsh lib/key-bindings.zsh
  zgen oh-my-zsh lib/history.zsh
  zgen load zsh-users/zsh-completions src
  zgen load lsl/zsh plugins

  autoload -Uz compinit
  if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
      rm ~/.zcompdump
  fi
  compinit -C -d ~/.zcompdump;

  zgen save
fi
