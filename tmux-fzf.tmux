#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmux bind-key f split-window -v "$CURRENT_DIR/scripts/main_fzf.sh"
