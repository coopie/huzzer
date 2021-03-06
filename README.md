A very-simple-subset-of-haskell fuzzer. With the ability to generate lexical tokens as well as plain code.

```
module Generated (function0,function1,function2) where

function0 :: Int -> Bool -> Bool -> Bool -> Bool -> Int -> Int
function0 a b c d e f = (function1 (2 /= 7) False False)

function1 :: Bool -> Bool -> Bool -> Int
function1 a b c = (8 * 0)

function2 :: Bool -> Int
function2 a = 1
```

it's available on pip by `pip install huzzer` (python3+ only)

## Using `huzzer`

The easiest way to use `huzzer` is from the command line:

```
>>>>> huzz
module Generated (function0,function1,function2) where

function0 :: Bool -> Bool
function0 a = ((function2 4 (0 >= 5)) <= ((mod 8 9) + (1 - (function2 0 a))))

function1 :: Bool -> Int -> Int -> Bool -> Bool
function1 a b c d = ((a && a) && (function0 (function1 True b c d)))

function2 :: Int -> Bool -> Int
function2 a b = (div (function2 (max a a) b) 3)
```

There are some options to vary the complexity of programs:
```bash
>>>>> huzz -h
Huzz.

Usage:
    huzz [--seed=<randomseed>] [--max-args=<maxarglen>] [--expr-depth=<exprdepth>]
    huzz -h | --help

Options:
    -h --help                    Show this screen.
    -s --seed=<randomseed>       Use <randomseed> to initialise RNG.
    -a --max-args=<maxarglen>    Maximum number of arguments a function can have [default: 8].
    -e --expr-depth=<exprdepth>  Maximum expression depth [default: 6].
```

### Using From Inside Python

```python
from huzzer.huzz import huzzer
from huzzer.tokenizing import tokenize

seed = 1337

random_haskell_code = huzzer(
    seed,
    max_expression_depth=4,
    max_type_signiature_length=5,
    max_number_of_functions=3,
)


tokens = tokenize(random_haskell_code)

non_whitespace_token_ids = [x.type for x in tokens if x.channel == 0]

print(random_haskell_code)
print('======================')
print(non_whitespace_token_ids)

```
```sh
module Generated (function0,function1,function2) where

function0 :: Bool -> Int -> Bool -> Bool -> Bool
function0 a b c d = ((function1 9) && (function0 d 1 d (function0 c b d d)))

function1 :: Int -> Bool
function1 a = (False || True)

function2 :: Bool -> Int -> Bool -> Bool -> Bool
function2 a b c d = (function2 True 9 False c)
======================
[1, 2, 51, 16, 4, 17, 4, 18, 52, 3, 53, 16, 5, 37, 6, 38, 6, 37, 6, 37, 6, 37, 53, 16, 8, 9, 10, 11, 7, 51, 51, 17, 48, 52, 36, 51, 16, 11, 40, 11, 51, 16, 10, 9, 11, 11, 52, 52, 52, 53, 17, 5, 38, 6, 37, 53, 17, 8, 7, 51, 50, 35, 49, 52, 53, 18, 5, 37, 6, 38, 6, 37, 6, 37, 6, 37, 53, 18, 8, 9, 10, 11, 7, 51, 18, 49, 48, 50, 10, 52]

```



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

### Distribution
```
python setup.py sdist bdist_wheel
twine upload dist/*
```
