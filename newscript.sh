# create new script file
function newscript(){
	touch "$@.sh"
	echo "script file, $@, created!" 
}