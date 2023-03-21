%{
/* Programa en lex que presenta en base hexadecimal los números
introducidos que están en base diez
*/
#include <stdlib.h>
#include <stdio.h>
int count = 0;
%}
palRes ent|finsi|haz|mientras|large|para|real|regresa|si|simb|sino
simEspeciales [\(\)\{\}\;\,\[\]]
digOctal [0-7]
digDecimal [1-9]
digHexadecimal [0-9A-Fa-f]
dig [0-9]
letHex [a-fA-F]
num {dig}+
guionBajo [_]
letrasMinusculas [a-z]
consCaracter '.'
consEnteraOctal 0{digOctal}*
consEnteraDecimal {digDecimal}+({digDecimal}|0)*
consEnteraHexadecimal 0(x|X){digHexadecimal}+
consEntera {consEnteraDecimal}|{consEnteraHexadecimal}|{consEnteraOctal}
consNumReales {num}+(\.){num}+|(\.){num}+|{num}+(\.)
consCadena \"(.)*\"
opArit "+"|"-"|"*"|"/"|"%"
opRelacionales "="|"/="|">="|"<"|">"|"<="
ident {letrasMinusculas}{letrasMinusculas}({guionBajo}|{letrasMinusculas})*

%%
{consEntera} {printf("%s Es una constante TIPO ENTERA \n",yytext);}
{consNumReales} {printf("%s Es una constante TIPO NUMERO REAL \n",yytext);}
{consCaracter} {printf("%s Es una constante TIPO CARACTER \n",yytext);}
{consCadena} {printf("%s Es una constante TIPO CADENA \n",yytext);}
{opArit} {printf("%s Es un operador aritmetico \n",yytext);}
{palRes} {printf("%s Es una palabra reservada \n",yytext);}
{opRelacionales} {printf("%s Es un Operador Relacional identificado \n",yytext);}
{simEspeciales} {printf("%s Es un Caracter Especial\n",yytext);}
{ident} {printf("%s Es un Identificador\n",yytext);}
. {printf("No se ha podido identificar su tipo\n");}
%%

main()
{yylex();

return 0;
}