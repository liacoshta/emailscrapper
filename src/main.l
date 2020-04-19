
%{
#include <stdio.h>
#include <string.h>


%}

letras [a-zA-Z0-9]
palavra {letras}+
palavra2 {letras}*
carac [._-]*
nome {palavra2}{carac}{palavra2}{carac}{palavra}
carcponto [.]
 


%%

{nome}[@]{nome} { printf("%s\n", yytext);}
{carac}{nome}{carac}[@]{nome}{carac}  ;

[[:space:]]+ ;
[[:^space:]]+ ;


%%

int main() {
	
		yylex();
	return 0;
}
