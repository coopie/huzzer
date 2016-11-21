#!/bin/sh
NUMBER_OF_TESTS=$1

seq 1 1 ${NUMBER_OF_TESTS} | parallel --progress --bar ./check_compile_friendly.sh {}

echo "DONE, failing test cases are located in failing_cases directory"

NUMBER_OF_FILES_IN_DIR=`ls failing_cases | wc -l`
NUMBER_FAILING_TEST_CASES=`expr ${NUMBER_OF_FILES_IN_DIR} / 2`
echo "It looks like you have ${NUMBER_FAILING_TEST_CASES} failing test cases"
