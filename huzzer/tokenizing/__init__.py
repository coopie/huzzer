from .tokenize import tokenize

def token_to_string(token_id):
    return TOKEN_MAP[token_id % len(TOKEN_MAP)]

TOKEN_MAP = [
    '\n',
    'module',
    'Generated',
    'where',
    ',',
    '::',
    '->',
    '=',
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'function0',
    'function1',
    'function2',
    'function3',
    'div',
    'mod',
    'max',
    'min',
    'not',
    'fromEnum',
    '+',
    '-',
    '*',
    '==',
    '/=',
    '>',
    '>=',
    '<',
    '<=',
    '||',
    '&&',
    'Bool',
    'Int',
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'True',
    'False',
    '(',
    ')'
]