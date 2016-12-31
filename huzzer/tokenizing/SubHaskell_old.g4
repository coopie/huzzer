/*
antlr4 -Dlanguage=Python3 -visitor SubHaskell.g4
*/
grammar SubHaskell;
prog:	'module' WS 'Generated' WS LPAREN WS funclist WS RPAREN WS 'where' WS
        (
            NEWLINE
            functionDecl+
        )+
;

funclist: FUNCTION_NAME (WS ',' WS FUNCTION_NAME)*;

functionDecl: type_signiature NEWLINE function_definition;

type_signiature: FUNCTION_NAME WS '::' WS TYPE  (WS '->' WS TYPE)*;

function_definition: FUNCTION_NAME (WS PARAM)+ WS '=' WS expr;

PARAM: 'a'|'b'|'c'|'d'|'e'|'f'|'g'|'h';

FUNCTION_NAME
    : 'function0'
    | 'function1'
    | 'function2'
    | 'function3'
    ;

PRELUDE_FUNCTION
    : 'div'
    | 'mod'
    | 'max'
    | 'min'
    | 'not'
    | 'fromEnum'
    ;

expr
    : function_invocation
    | infix_expr
    | int_value
    | BOOL
    | PARAM
    ;

function_invocation
    : LPAREN WS (FUNCTION_NAME | PRELUDE_FUNCTION) WS expr+ WS RPAREN;

infix_expr
    : LPAREN WS expr WS infix_function WS expr WS RPAREN;

infix_function
    : '+'
    | '-'
    | '*'
    | '=='
    | '/='
    | '>'
    | '>='
    | '<'
    | '<='
    | '||'
    | '&&'
    ;

/*infix_function
    : PLUS
    | MINUS
    | MUL
    | EQ
    | NEQ
    | GT
    | GTE
    | LT
    | LTE
    | OR
    | AND
    ;

PLUS: '+';
MINUS: '-';
MUL: '*';
EQ: '==';
NEQ: '/=';
GT: '>';
GTE: '>=';
LT: '<';
LTE: '<=';
OR: '||';
AND: '&&';
*/



TYPE: 'Bool' | 'Int';
int_value     : '0'|'1'|'2'|'3'|'4'|'5'|'6'|'7'|'8'|'9' ;
BOOL: ('True' | 'False');

LPAREN: '(';
RPAREN: ')';
NEWLINE : [\r\n]+ ;
WS : (' ' | '\t')+ -> channel(HIDDEN);
