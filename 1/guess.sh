#!/bin/bash

let low=0
let high=100
while true; do
 ((guess = low + (high-low)/2))
 read -p "$high, $low; $guess : H/l/d?" answer
 if [ $answer = l ]; then
   ((high = guess))
 elif [ $answer = d ]; then
   echo "gg"
   break
 else
   ((low = guess))
 fi 
 if [ $high -eq $low ]; then
   echo "gg"
   break
 fi
done
