#!/bin/zsh
# inpath verifies that a program is valid (can be found in path directory)

in_path()
{
	# given a command and the path, attempt to find command
	# return 0 if found and executable
	# return 1 is not found
	# temporaily modifies internal field separator
	
	cmd=$1
	ourpath=$2
	result=1
	oldIFS=$IFS
	IFS=":"
	
	for directory in "$ourpath"
	do
		if [ -x $directory/$cmd ] ;  then
			echo "found command"
			result=0
		fi
	done
	
	IFS=$oldIFS
	return $result
}

checkForCmdInPath()
{
	var=$1
	if [ "$var" != "" ]; then
		if [ "${var:0:1}" ="/" ]; then
			if [ ! -x $var ]; then
				return 1
				fi
	elif ! in_path $var "$PATH" ; then
		return 2
		fi
	fi
}

#
# if [ $# -ne 1 ] ; then
# 	echo "usage: $0 command" >&2
# 	exit 1
# fi
#
# checkForCmdInPath "$1"
# case $? in
# 	0 ) echo "$1 found in path" 							;;
# 	1 ) echo "$1 not found or not executable" ;;
# 	2) echo "$1 not found in PATH" 						;;
# esac
# exit 0