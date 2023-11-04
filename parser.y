%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);

extern int yylex();
extern int yyparse();
%}

%token NUMBER
%token PLUS MINUS TIMES DIVIDE EOL LPAREN RPAREN

%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%left PLUS MINUS
%left TIMES DIVIDE

%%

program:
    program expression EOL   { printf("Result = %d\n", $2); }
    | /* empty */
    ;

expression:
    NUMBER                  { $$ = $1; }
    | expression PLUS expression   { $$ = $1 + $3; }
    | expression MINUS expression  { $$ = $1 - $3; }
    | expression TIMES expression  { $$ = $1 * $3; }
    | expression DIVIDE expression { $$ = $1 / $3; }
    | LPAREN expression RPAREN     { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
  fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
  printf("Enter expressions to evaluate:\n");
  yyparse();
  return 0;
}
