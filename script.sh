#!/bin/bash

#TODO: Receive name as parameter

if [ $# -ne 1 ]; then
    echo "Usage: "$0" filename.csv"

else
    #Pre-processing
    period=`(sed -n '2,2 p' TESTCSV.csv | cut -d ':' -f2) | tr -d '\n' | tr -d '\r'`  #Gets the time between samplings

    cp $1 PROCESSED_CSV.csv
    sed -i '1,4d' PROCESSED_CSV.csv
    
    #Calling Octave for processing
    octave -q csvtodlog.m
    
    #MountingXML
    cp settings.dlog.init out.dlog
    sed -i 's/@@/'$period'/' out.dlog
    
    cat dlog2.bin >> out.dlog
    
    rm -rf PROCESSED_CSV.csv
fi
