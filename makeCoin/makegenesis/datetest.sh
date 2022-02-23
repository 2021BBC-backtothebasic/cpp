#!/bin/bash

read -P "Enter a date (dd-mm-yyyy) " getDate
if date=$(date -d "$getDate" + "%d-%m-%Y); then
	echo $date
