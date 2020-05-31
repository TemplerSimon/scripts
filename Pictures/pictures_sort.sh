#!/bin/bash
#set -x

function getModyficationDate(){
    local picture=$1
    local picturesDate=`stat ${picture} | grep Modyfikacja | sed -e 's/[0-9][0-9]:.*//g' | sed -e 's/.*://g'| xargs`

    echo ${picturesDate}
    
}

function copyPictureToDir(){
    local datePattern=`echo $1 | sed -e 's/-/\//g' `
    local picture=$2

    mkdir -p $datePattern

    mv $picture $datePattern/$picture
    
}


################### Program logic ######################
echo "Starting sorting pictures in current dir"

for i in `ls`
do
    echo "Processing pictures $i"
    picturesDate=`getModyficationDate $i`

    copyPictureToDir $picturesDate $i
done
     
