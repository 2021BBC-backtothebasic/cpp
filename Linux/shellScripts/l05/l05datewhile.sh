#!/bin/bash

startDate=`date +"%Y%m%d" -d "20220101"`
endDate=`date +"%Y%m%d" -d "20220201"`

while [ "$startDate" != "$endDate" ];
do
	echo $startDate

	startDate=`date +"%Y%m%d" -d "$startDate+1 day"`
done
