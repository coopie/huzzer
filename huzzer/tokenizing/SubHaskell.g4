/*
antlr4 -Dlanguage=Python3 -visitor SubHaskell.g4
*/
grammar SubHaskell;
prog:	'module' WS 'Generated' WS lparen WS funclist WS rparen WS 'where' WS
        (
            NEWLINE
            functionDecl+
        )+
;

funclist: function_name (WS ',' WS function_name)*;

functionDecl: type_signiature NEWLINE function_definition;

type_signiature: function_name WS '::' WS type_name  (WS '->' WS type_name)*;

function_definition: function_name (WS param)+ WS '=' WS expr;

param: 'a'|'b'|'c'|'d'|'e'|'f'|'g'|'h';

function_name
    : 'function0'
    | 'function1'
    | 'function2'
    | 'function3'
    ;

prelude_function
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
    | bool_value
    | param
    ;

function_invocation
    : lparen WS (function_name | prelude_function) WS expr+ WS rparen;

infix_expr
    : lparen WS expr WS infix_function WS expr WS rparen;

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



type_name: 'Bool' | 'Int';
int_value     : '0'|'1'|'2'|'3'|'4'|'5'|'6'|'7'|'8'|'9' ;
bool_value: 'True' | 'False';

lparen: '(';
rparen: ')';
NEWLINE : [\r\n]+ ;
WS : (' ' | '\t')+ -> channel(HIDDEN);
