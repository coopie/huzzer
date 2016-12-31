"""
Generate random code, tokenise it, then re-build it to code again. Used
for testing.
"""
from sys import argv

from huzzer.huzz import huzzer
from huzzer.tokenizing import tokenize, token_to_string


def generate_code_from_seed(seed: int):
    code = huzzer(seed)

    ts = tokenize(code)
    ts = [x for x in ts if x.channel == 0]

    a = [x.type for x in ts]

    recon = ' '.join(token_to_string(x) for x in a)
    return recon


if __name__ == '__main__':
    seed = int(argv[1])
    print(generate_code_from_seed(seed))
