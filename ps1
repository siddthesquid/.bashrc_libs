#!/usr/bin/bash

#######
# PS1 #
#######

ps1_section(){
	[[ $# -eq 4 ]] || { echo "usage: ps1_section [command] [background] [foreground] [next_background]"; return 1; }
	command="$1"
	background="$2"
	foreground="$3"
	next_background="$4"
	echo -e "$(ps1_encode_style bg_$background fg_$foreground) $command $(ps1_encode_style fg_$background bg_$next_background)$(ps1_divider)$(ps1_reset_style)"
}

ps1_username(){
	ps1_section "$(whoami)" dark_gray white white
}

ps1_hostname(){
	ps1_section "$(hostname)" white black default
}

ps1_date(){
	ps1_section "$(date +"%m/%d/%Y")" light_cyan black cyan
}

ps1_time(){
	ps1_section "$(date +"%H:%M:%S")" cyan white light_purple
}

ps1_git_color(){
	PS1_GITS_COLOR=default
	if git_is_repo; then
		if git_is_clean; then
			PS1_GITS_COLOR=green
		else
			PS1_GITS_COLOR=red
		fi
	fi
	echo $PS1_GITS_COLOR
}

ps1_directory(){
	ps1_section "$(pwd)" light_purple black "$(ps1_git_color)"
}

ps1_git_info(){
	if git_is_repo; then
		ps1_section "$(gitbc)" $(ps1_git_color) white default
	else
		echo ""
	fi
}

export PS1='\n$(ps1_date)$(ps1_time)$(ps1_directory)$(ps1_git_info)\n$(ps1_username)$(ps1_hostname) '
