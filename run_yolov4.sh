#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: run_yolo <dir w/ images>"
    exit
fi

mkdir predictions
mkdir coordinates 
indir=$1
for f in $indir/*; do
     echo "$f"
    ./darknet detect cfg/yolov4.cfg yolov4.weights $f
    b=$(basename $f)
    echo "$b"
    name=${b%.*}
    mv predictions.jpg predictions/sharpened/$name-predictions.jpg
    mv predictions.csv coordinates/sharpened/$name-coordinates.csv
done
