#!/bin/sh

OUTPUT_DIRECTORY=data/`hostname`_`date +%F`
mkdir -p $OUTPUT_DIRECTORY
OUTPUT_FILE=$OUTPUT_DIRECTORY/measurements_`date +%R`.txt

rm -f $OUTPUT_FILE
touch $OUTPUT_FILE
scripts/generator_exp3.R | xargs -n3 -I {args} \
    sh -c 'echo "Args: "{args}; ./src/parallelQuicksort {args}' >> $OUTPUT_FILE
