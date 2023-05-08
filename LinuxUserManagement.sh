#!/bin/bash
#Start of Shell Script (Bash)

#Clearing the terminal screen
clear 
#Welcome message
echo "Welcome to the user management script! :D"
echo
echo
#Listing users
awk -F: '{print $1}' /etc/passwd
echo
echo
#Start of while loop for user input
while :
do
#Printing menu
echo "<Type [1] to create a new user>"
echo "<Type [2] to delete an already existing user>"
echo "<Type [3] to list the current users>"
echo "<Type [4] to exit the shell script>"
echo
echo
#Keyboard input
read -p "Please type the number that corresponds to the desired action: " prompt
#Start of case in order to define actions according to the user input
case $prompt in
    #1st choice: User creation
    1) echo
       echo "You have chosen to create a new user!"
       read -p "Please type a name for the new user:" username
       adduser $username
       echo;;
    #2nd choice: User deletion
    2) echo
       echo
       read -p "Please type the name of the user you would like to delete:" delname
       deluser $delname
       echo;;
    #3rd choice: Printing users
    3) echo
       echo
       #Printing message listing the users
       echo "The list of the current users is shown below:"
       echo
       echo
       #Listing users
       awk -F '{print $1}' etc/passwd
       echo
       echo;;
    #4th choice: Exiting case (and the script)
    4) echo
       echo
       echo "Exiting the User Management Shell Script"
       exit;;
    #Any other choice (non valid input)
    *) echo
       echo
       echo "The input was not valid!"
       echo "Please try again!"
       echo;;
    #End of case
    esac
    #End of while loop
    done
    