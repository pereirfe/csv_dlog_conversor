#!/bin/bash

#TODO: Receive name as parameter

#Pre-processing
period=`(sed -n '2,2 p' TESTCSV.csv | cut -d ':' -f2) | tr -d '\n' | tr -d '\r'`  #Gets the time between samplings

cp TESTCSV.csv PROCESSED_CSV.csv
sed -i '1,4d' PROCESSED_CSV.csv

#Calling Octave for processing
octave csvtodlog.m

#MountingXML
cp settings.dlog.init out.dlog
sed -i 's/@@/'$period'/' out.dlog

cat dlog2.bin >> out.dlog

#mounting file
cp B.csv TESTCSV.csv
