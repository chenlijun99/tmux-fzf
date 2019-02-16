#!/usr/bin/env bash

################################################################################
#
# @brief Handles link-window creation
#
# @param source_window: information abount the source_window in the following format
# (#session_name:#window_name)
#
# @param target_window (-c flag)
# if a target_window is passed, \p target_window will be linked to \p source_window
# if -c is passed the current window will be linked to \p source_window
# if not passed, a new window in the current session will be created 
# and linked to \p source_window
# 
################################################################################
main()
{
	local source_window=$1
	local target_window=$2

	if [[ "$target_window" == '-c' ]]; then
		tmux link-window -k -s "$source_window" \
			-t "$(tmux display-message -p '#{session_name}:#{window_id}')"
	elif [[ -z "$target_window" ]]; then
		tmux link-window -s "$source_window"
	else
		tmux link-window -k -s "$source_window" -t "$target_window"
	fi
}

main "$@"
