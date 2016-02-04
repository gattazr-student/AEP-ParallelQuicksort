#!/bin/sh

OUTPUT_DIRECTORY=data/`hostname`_`date +%F`
mkdir -p $OUTPUT_DIRECTORY
OUTPUT_FILE=$OUTPUT_DIRECTORY/measurements_`date +%R`.txt

rm -f $OUTPUT_FILE
touch $OUTPUT_FILE
scripts/generator_exp2.R | xargs -n1 -I {size} \
    sh -c 'echo "Size: "{size}; ./src/parallelQuicksort {size}' >> $OUTPUT_FILE
