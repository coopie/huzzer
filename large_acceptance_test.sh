#!/bin/sh
NUMBER_OF_TESTS=$1

mkdir -p failing_cases/compilation_failures
mkdir -p failing_cases/nondeterminism_failures

seq 1 1 ${NUMBER_OF_TESTS} | parallel --progress --bar ./check_compile_friendly.sh {}

echo "DONE, failing test cases are located in failing_cases directory"

NUMBER_OF_FILES_IN_COMPILE_DIR=`ls failing_cases/compilation_failures | wc -l`
NUMBER_OF_FILES_IN_DETERMINISM_DIR=`ls failing_cases/nondeterminism_failures | wc -l`

NUMBER_FAILING_COMPILE_TEST_CASES=`expr ${NUMBER_OF_FILES_IN_COMPILE_DIR}`
NUMBER_FAILING_DETERMINISM_TEST_CASES=`expr ${NUMBER_OF_FILES_IN_DETERMINISM_DIR}`
echo "${NUMBER_FAILING_COMPILE_TEST_CASES} test cases failing compilation"
echo "${NUMBER_FAILING_DETERMINISM_TEST_CASES} test cases failing deteminism"
