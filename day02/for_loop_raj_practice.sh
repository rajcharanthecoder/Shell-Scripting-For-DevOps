#!/bin/bash
#This is for and while loop

<<task

$1 is arg1 and which is folder name
$2 is start range
$3 is end range

task

for (( num=1 ; num<=5 ; num=num+1 ))
do
	mkdir "demo.$num"
done

for (( num=$2 ; num<=$3 ; num++ ))
do
	mkdir "$1.$num.demo"
done

