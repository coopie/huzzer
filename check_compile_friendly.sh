#!/bin/sh
mkdir -p failing_cases

SEED=$1
FILENAME=${SEED}-`date +"%d-%m-%y_%T"`

python huzzer -s ${SEED} > failing_cases/${FILENAME}.hs
ghc -fno-code failing_cases/${FILENAME}.hs 2> failing_cases/${FILENAME}-compiler_output.txt 1> /dev/null


if [[ $? == 0 ]]; then
    rm failing_cases/${FILENAME}.hs
    rm failing_cases/${FILENAME}-compiler_output.txt
fi
