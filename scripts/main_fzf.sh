#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SEPARATOR=":"

################################################################################
#
# @brief Call the action associated with the key
#
# @param key: the key combination that identifies the command
#
# @param entries: fzf selected entries
# 
################################################################################
command_dispatcher()
{
	declare key
	read key
	declare -a entries=()
	while read -r line; do
		entries+=( "$line" )
	done

	if [[ "$key" == "ctrl-d" ]]; then
		"$CURRENT_DIR/actions/kill-window.sh" "${entries[@]}"
	elif [[ "$key" == "ctrl-l" ]]; then
		local source_window=$(echo ${entries[0]} | cut -d "$SEPARATOR" -f 1,3)
		local destination_window=$(echo ${entries[1]} | cut -d "$SEPARATOR" -f 1,3)
		"$CURRENT_DIR/actions/link-window.sh" "$source_window" "$destination_window"
	elif [[ "$key" == "ctrl-alt-l" ]]; then
		local source_window=$(echo ${entries[0]} | cut -d "$SEPARATOR" -f 1,3)
		"$CURRENT_DIR/actions/link-window.sh" "$source_window" -c
	elif [[ "$key" == "Enter" ]]; then
		local target_window=$(echo ${entries[0]} | cut -d "$SEPARATOR" -f 1,3 --output-delimiter=' ')
		"$CURRENT_DIR/actions/enter-window.sh" $target_window
	fi
}

main()
{
	tmux list-windows -a -F "#{session_name}$SEPARATOR#{window_name}$SEPARATOR#{window_id}$SEPARATOR#{pane_pid}" \
		| fzf -d "$SEPARATOR" -m --with-nth='..2' \
		--reverse \
		--expect "ctrl-l,ctrl-alt-l,Enter,ctrl-d" | command_dispatcher
}

main
