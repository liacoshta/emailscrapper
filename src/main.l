
%{
#include <stdio.h>
#include <string.h>


%}

letras [a-zA-Z0-9]
palavra {letras}+
carac [._-]*
nome {palavra}{carac}{palavra}{carac}{palavra}



%%



{nome}[@]{nome}[.com]* { printf("%s\n", yytext);}

[[:space:]]+ ;
[[:^space:]]+ ;


%%

int main() {
	
		yylex();
	return 0;
}
