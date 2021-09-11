#!/bin/bash
#THIS SCRIPT WILL CHECK FOR THE USER NAME BEFORE CREATING IT.

#Read the Username from the keyboard.
#read -p "Please enter the username:" USER_NAME
USERS="$@"
for USER_NAME in ${USERS}
do
#crete Complex Password.
SPEC='!@#$%^&*()_'
SPECCHAR=$(echo ${SPEC}|FOLD -w1|shuf|head -1)
PASSWORD=Somu@${RANDOM}${SPECCHAR}

#Check if the userExists and if exists thow error.
EXUSER=$(cat /etc/passwd|grep -i${USER_NAME} |cut -d ":" -f 1)
#echo "The existing username is ${EXUSER} ."
if [[ ${EXUSER} == ${USER_NAME} ]]
then
echo "User already exists.please use a different user-name...!!"
else 
echo "Creating the new user...!!"
 sleep 3s
 useradd -m ${USER_NAME}
 echo ${PASSWORD} |passwd --stdin ${USER_NAME}
 passwd -e ${USER_NAME}
#print the username and password.
echo "username is ${USER_NAME} password is ${PASSWORD}."
fi
done
