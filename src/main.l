
%{
#include <stdio.h>
#include <string.h>


%}

letras [a-zA-Z0-9]
palavra {letras}+
nome {palavra}({carac}{palavra})*
email {nome}[@]{nome}
nomegeral [@,!]*{nome}
caracespeciais [!@,-]*
carac [._-]*
caracponto[.]
caractraco [-]

%%
{caracponto} {};
{email} { printf("%s\n", yytext);} ;
{caractraco}{email} ;
{email}{caractraco} ;
[[:space:]]+ ;
{nomegeral} ;
{caracespeciais} ;


%%

int main() {
	
		yylex();
	return 0;
}
