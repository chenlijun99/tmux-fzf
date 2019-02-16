#!/usr/bin/env bash


################################################################################
#
# @brief Switch to the given window
#
# @param target_session: the session you want to switch to
#
# @param target_window: the window you want to switch to
# 
################################################################################
main()
{
	local target_session="$1"
	local target_window="$2"
	tmux switch-client -t "$target_session"; tmux select-window -t "$target_window"
}

main "$@"
