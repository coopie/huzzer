A very-simple-subset-of-haskell fuzzer

<Example here>


## Setup
Make sure you have python3 on your machine (`which python3` should print a path to it).

Set up a `virtualenv` with `virtualenv -p \`which python3\` env`

Activate the environment with `source env/bin/activate`

Install requirements `pip install -r requirements.txt`

Then you should be good to go. To leave the virtualenv, type `deactivate`

## Testing
To run all of the tests, run `nosetests`.

To run larger acceptance tests (against the ghc compiler), you will need `ghc` and `parallel` installed.
run `./large_acceptance_test.sh <number of tests>`

## TODOs
* multiple definitions for functions
* some unary expressions (fromEnum, !, abs)
* more commandline arguments for customisation
