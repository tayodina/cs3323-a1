%{ 
//Tayo Dina, 113455217; 

#include "tokens.h"
# undef yywrap
# define yywrap() 1



#undef YY_DECL
#define YY_DECL int yylex()
YY_DECL;


// Code run each time a pattern is matched.
#undef  YY_USER_ACTION  
# define YY_USER_ACTION  {}



%}

%option yylineno
%option noyywrap 

DIGIT [0-9] 
ALPHA [@][a-zA-Z][a-zA-Z0-9_]*
FLOAT [0-9]?[+-]?[0-9]+"."[0-9]+

%%





\/\/.*$   {}
[ \t]+						
[\n]+							


";" { return ';'; }

"=" { return OP_ASSIGN; }

"+" { return OP_ADD; }

"-" { return OP_SUB; }

"*" { return OP_MUL; }

"/" { return OP_DIV; }

"+=" { return OP_ADDINC; }

"++" { return OP_PLUSPLUS; }

"<=" { return OP_LEQ; }

">=" { return OP_GEQ; }

"==" { return OP_EQ; }

"~=" { return OP_DIFF; }

"<" { return OP_LT; }

">" { return OP_GT; }

"print" { return K_PRINT; }

"foreach" { return K_FOREACH; }

"while" { return K_WHILE; }

"repeat" { return K_REPEAT; }

"until" { return K_UNTIL; }

"begin" { return K_BEGIN; }

"end" { return K_END; }

"declare" { return K_DECLARE; }

"if" { return K_IF; }

"then" { return K_THEN; }

"integer" { return K_INTEGER; }

"float" { return K_FLOAT; }

"MAIN" { return K_MAIN; }

{DIGIT}+ { return L_INTEGER; }

{ALPHA} { return T_ID; }

{FLOAT} { return L_FLOAT; }

<<EOF>>	{ return T_EOF ; }
.        { printf ("Unexpected character\n"); exit (1); }


%%
