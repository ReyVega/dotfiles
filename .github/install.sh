#!/bin/bash

git clone --bare git@github.com:ReyVega/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles --work-tree=$HOME push --set-upstream origin main
git --git-dir=$HOME/.dotfiles --work-tree=$HOME config core.bare false
git --git-dir=$HOME/.dotfiles --work-tree=$HOME config core.worktree $HOME
git --git-dir=$HOME/.dotfiles --work-tree=$HOME config status.showUntrackedFiles no
