#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

################################################################################
#
# @brief Delete the given window
#
# @param target_session: the session you want to switch to
#
# @param target_window: the window you want to switch to
# 
################################################################################
kill-window()
{
	local session_name="$1"
	local window_name="$2"
	local window_id="$3"
	local pane_pid="$4"

	if [[ -z $(pgrep -P "$pane_pid") ]]; then
		tmux kill-window -t "$session_name:$window_id"
	else
		tmux confirm-before -p \
			"Kill window $session_name:$window_name? There are running process (y/n)" \
			"kill-window -t $session_name:$window_id"
	fi
}

main()
{
	declare -a entries=( $@ )

	for entry in "${entries[@]}"; do
		kill-window $(echo $entry | cut -d ':' -f1-4 --output-delimiter=' ')
	done
}

main "$@"
