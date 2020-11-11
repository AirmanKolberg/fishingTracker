#!/usr/bin/env bash
bite="No Bite"
fish=0
caught="No"

# NOTE: Make lists of equipment from which the user can select for each variable

main_function()

{

clear
echo "Press enter when you cast your line."
read
now=$(date)
clear
echo "Now we're fishin'!  Press enter again when your cast has finished."
read
clear
echo "Bite?  (0 = no, 1 = yes)"
read bite
clear

if [ $bite -eq 1 ]
then
	echo "Caught?"
	read caught
	clear
	echo "Type of fish:"
	read fish
	clear
	bite="Yes"
else
	bite="No"
	fish="None"
fi

echo "Date/Time: $now | Bait: $bait | Bite: $bite | Fish: $fish | Caught: $caught | Location: $location | Position: $position | Hook: $hook | Bobber: $bobber | Rod Length: $rod | Line: $line"
echo "Date/Time: $now | Bait: $bait | Bite: $bite | Fish: $fish | Caught: $caught | Location: $location | Position: $position | Hook: $hook | Bobber: $bobber | Rod Length: $rod | Line: $line" >> castRecords.txt

echo ""
echo "Fish again? (0 = no, 1 = yes)"
read continue
clear
if [ $continue -eq 0 ]
then
	exit
else
	echo "Would you like to change your current configuration?  (0 = no, 1 = yes)"
	read change
	clear
	if [ $change -eq 1 ]
	then

		echo "Change rod?  (0 = no, 1 = yes)"
		read changeRod
		clear
		if [ $changeRod -eq 1 ]
		then
			echo "New Rod:"
			read rod
			clear
else
	clear
fi

echo "Change bait?  (0 = no, 1 = yes)"
read changeBait
clear

if [ $changeBait -eq 1 ]
then
	echo "New Bait:"
	read bait
	clear
else
	clear
fi

echo "Change hook?  (0 = no, 1 = yes)"
read changeHook
clear

if [ $changeHook -eq 1 ]
then
	echo "New Hook:"
	read hook
	clear
else
	clear
fi

echo "Change bobber?  (0 = no, 1 = yes)"
read changeBobber
clear

if [ $changeBobber -eq 1 ]
then
	echo "New Bobber:"
	read bobber
	clear
else
	clear
fi

echo "Change line?  (0 = no, 1 = yes)"
read changeLine
clear

if [ $changeLine -eq 1 ]
then
	echo "New Line:"
	read line
	clear
else
	clear
fi

else

	main_function
	
fi

	main_function
	
fi

}

build_new_setup()

{

	clear
	echo "Location:"
	read location
	clear
	echo "Boat, Land, or Dock?"
	read position
	clear
	echo "Rod:"
	read rod
	clear
	echo "Hook:"
	read hook
	clear
	echo "Bobber:"
	read bobber
	clear
	echo "Line:"
	read line
	clear
	echo "Bait:"
	read bait
	clear
	echo "You've built a custom setup!"
	echo ""
	echo "Please name your setup (it IS case-sensitive):"
	read newSetupName
	
		echo "#!/usr/bin/env bash" >> SavedConfigurations/$newSetupName.sh
		echo "" >> $newSetupName.sh
		echo "export location="#$location# | tr '#' '"' >> $newSetupName.sh
		echo "export position="#$position# | tr '#' '"' >> $newSetupName.sh
		echo "export rod="#$rod# | tr '#' '"' >> $newSetupName.sh
		echo "export hook="#$hook# | tr '#' '"' >> $newSetupName.sh
		echo "export bobber="#$bobber# | tr '#' '"' >> $newSetupName.sh
		echo "export line="#$line# | tr '#' '"' >> $newSetupName.sh
		echo "export bait="#$bait# | tr '#' '"' >> $newSetupName.sh
		echo '[[ "${#BASH_SOURCE[@]}" -gt "1" ]] && { return 0; }' >> $newSetupName.sh
	
	main_function

}

load_setups()

{

	clear
	echo "Here are a list of your saved setups:"
	echo ""
	ls | grep -v fishingTracker.sh | grep -v castRecords.txt
	echo ""
	echo "Type in the setup you'd like to use.  [NOTE: It IS case-sensitive]"
	read setupSelection
	source $setupSelection
	clear
	
	main_function

}

# -----PROGRAM STARTS HERE-----

clear
echo "Welcome to the Fishing Tracker App Menu!  Please select from the following:"
echo ""
PS3='Please enter your choice: '
options=("Go Fishing with New Setup" "Build, Save & Use New Custom Setup" "Load Custom Setup" "Exit")
select opt in "${options[@]}"
do
	case $opt in
		"Go Fishing with New Setup")
			break
			;;
		"Build, Save & Use New Custom Setup")
			build_new_setup
			;;
        	"Load Custom Setup")
      			load_setups
            		;;
        	"Exit")
            		exit
            		;;
        	*) echo "$REPLY was not then, nor is it now, nor will it ever be a valid input.  Please try again.";;
        esac
done

clear
echo "Load custom setup?  (0 = no, 1 = yes)"
read customRig
clear

if [ $customRig -eq 1 ]
then
	clear
	echo "Here are a list of your saved setups:"
	echo ""
	ls | grep -v fishingTracker.sh | grep -v castRecords.txt
	echo ""
	echo "Type in the setup you'd like to use.  [NOTE: It IS case-sensitive]"
	read setupSelection
	source $setupSelection
	clear
	
	main_function
else

	echo "Location:"
	read location
	clear
	echo "Boat, Land, or Dock?"
	read position
	clear
	echo "Rod:"
	read rod
	clear
	echo "Hook:"
	read hook
	clear
	echo "Bobber:"
	read bobber
	clear
	echo "Line:"
	read line
	clear
	echo "Bait:"
	read bait
fi

main_function
