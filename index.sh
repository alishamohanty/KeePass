#!/bin/bash
# ----------------------------------
# Step #1: Define variables
# ----------------------------------
EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'
 
# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

register(){
	echo "~~~~~~~~~~~~~~~~~~~~~~~"
    echo "       REGISTER        "
    echo "~~~~~~~~~~~~~~~~~~~~~~~"
    pause
}
 
# do something in two()
login(){
	echo "~~~~~~~~~~~~~~~~~~~~~~~"
    echo "         LOGIN         "
    echo "~~~~~~~~~~~~~~~~~~~~~~~"
    read  -p   "Enter Username: "   username
    read -s -p "Enter Password: "   password
	echo "Before this"
	echo $(python login.py) #This is where errorz
	echo t
    pause
}
 
# function to display menus
show_menus1() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " Welcome to KeyPass"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Register"
	echo "2. Login"
	echo "3. Exit"
}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.
read_options(){
	local choice
	read -p "Enter choice [ 1 - 3] " choice
	case $choice in
		1) register ;;
		2) login ;;
		3) exit 0 ;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
 
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
 
	show_menus1
	read_options
done