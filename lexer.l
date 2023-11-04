%{
#include "parser.tab.h"
%}

%%

[0-9]+   { yylval = atoi(yytext); return NUMBER; }
[ \t]    ; // Ignore whitespace
\n       { return EOL; }
"+"      { return PLUS; }
"-"      { return MINUS; }
"*"      { return TIMES; }
"/"      { return DIVIDE; }
"("      { return LPAREN; }
")"      { return RPAREN; }

%%

int yywrap(void) {
  return 1;
}
