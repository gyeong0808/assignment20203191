#!/bin/bash

set --'getopt -q ab:c "$@"
while [-n ""$1"]
do 
	case "$1" in
		-a)echo "find -a";;
                -b)addpara ="$2"
                   echo "fine -b, with $addpara";;
                   shift;;
		-c)echo "fine -c"
		--)shift
		break;;
		*)echo "$1 is not option"
	esac
	shift
done
count=1;
for addpara in "$@"
do
echo " parameter #$count: $addpara"
count =$[$count +1]
done
		
	
