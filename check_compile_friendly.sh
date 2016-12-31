#!/bin/sh
# Checks that generation is deterministic and that code compiles

mkdir -p failing_cases

SEED=$1
FILENAME=${SEED}--`date +"%d-%m-%y_%T"`

python huzzer -s ${SEED} > failing_cases/${FILENAME}.hs

# Check they are the same
python huzzer -s ${SEED} > failing_cases/${FILENAME}_comparison.hs

diff failing_cases/${FILENAME}.hs failing_cases/${FILENAME}_comparison.hs > failing_cases/${FILENAME}_comparison.txt
if [[ $? != 0 ]]; then
    mkdir -p failing_cases/nondeterminism_failures/${FILENAME}
    cp failing_cases/${FILENAME}* failing_cases/nondeterminism_failures/${FILENAME}

fi
rm failing_cases/${FILENAME}_comparison*


#  run compiler over the same code
ghc -fno-code failing_cases/${FILENAME}.hs 2> failing_cases/${FILENAME}-compiler_output.txt 1> /dev/null


if [[ $? != 0 ]]; then
    mkdir -p failing_cases/compilation_failures/${FILENAME}
    cp failing_cases/${FILENAME}* failing_cases/compilation_failures/${FILENAME}

fi
rm failing_cases/${FILENAME}-compiler_output.txt

# test tokenising reconstruction
python gen_code_from_token.py ${SEED} > failing_cases/${FILENAME}-recon.hs
ghc -fno-code failing_cases/${FILENAME}-recon.hs 2> failing_cases/${FILENAME}-recon-compiler_output.txt 1> /dev/null

if [[ $? != 0 ]]; then
    mkdir -p failing_cases/token_failures/${FILENAME}
    cp failing_cases/${FILENAME}* failing_cases/token_failures/${FILENAME}
fi
rm failing_cases/${FILENAME}-recon.hs
rm failing_cases/${FILENAME}-recon-compiler_output.txt

rm failing_cases/${FILENAME}.hs
