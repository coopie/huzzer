"""
Huzzer.

Usage:
    huzzer [--seed=<randomseed>]
    huzzer -h | --help

Options:
    -h --help               Show this screen.
    -s --seed=<randomseed>  Use <randomseed> to initialise RNG.
"""
from docopt import docopt
from huzzer.version import VERSION
from random import randint


def huzzer(seed):
    print('your seed is: ' + str(seed))


def main():
    arguments = docopt(__doc__, version=VERSION)
    randomseed_str = arguments.get('--seed')

    if randomseed_str is not None:
        try:
            randomseed = int(randomseed_str)
        except Exception:
            print('error: randomseed needs to be an integer, got: ' + randomseed_str)
    else:
        randomseed = randint(0, 1 << 16)

    huzzer(randomseed)

if __name__ == '__main__':
    main()
