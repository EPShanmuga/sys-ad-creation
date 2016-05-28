#!/bin/bash
#initialising variable
COUNTER=0
#creating a directory
mkdir -p ./mydir
#loop for creation of 100 files
while [ $COUNTER -lt 100 ]; do
#save randomly generated string in the file
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1 > ./mydir/file$COUNTER
#changing date of creation
touch -d "2 days ago"  ./mydir/file$COUNTER
#extend the size to 10kb
truncate -s 10k ./mydir/file$COUNTER
let COUNTER=COUNTER+1
done
#changing into read-only access
chmod 444 ./mydir/*




