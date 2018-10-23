%{
#include "exp.tab.h"
#include "string.h"
#include "def.h"
int yycolumn=1;
#define YY_USER_ACTION    	yylloc.first_line=yylloc.last_line=yylineno; \
	yylloc.first_column=yycolumn;	yylloc.last_column=yycolumn+yyleng-1; yycolumn+=yyleng;
typedef union {
	int type_int;
	int type_float;
	char type_char;
	char type_id[32];
	struct node *ptr;
} YYLVAL;
#define YYSTYPE YYLVAL

%}
%option yylineno

id   [A-Za-z][A-Za-z0-9]*
int    [0-9]+
float  ([0-9]*\.[0-9]+)|([0-9]+\.)
char	('[a-zA-Z]')

%%
{int}        {yylval.type_int=atoi(yytext); return INT;}
{float}      {yylval.type_float=atof(yytext); return FLOAT;}
{char}		{yylval.type_char=yytext[1];printf("Thisis: %s",yytext);return CHAR;}
"int"        {strcpy(yylval.type_id,  yytext);return TYPE;}
"float"      {strcpy(yylval.type_id,  yytext);return TYPE;}
"char"		{strcpy(yylval.type_id, yytext);return TYPE;}

"return"     {return RETURN;}
"if"         {return IF;}
"else"       {return ELSE;}
"while"      {return WHILE;}

"++"		{return SELPL;}
"--"		{return SELMI;}
{id}       {strcpy(yylval.type_id,  yytext); return ID;/*由于关键字的形式也符合表示符的规则，所以把关键字的处理全部放在标识符的前面，优先识别*/}
";"			{return SEMI;}
","			{return COMMA;}
">"|"<"|">="|"<="|"=="|"!=" {strcpy(yylval.type_id, yytext);;return RELOP;}
"+="		{return PLUEQU;}
"-="		{return MINEQU;}
"*="		{return STAEQU;}
"/="		{return DIVEQU;}
"%="		{return REMEQU;}
"="			{return ASSIGNOP;}
"+"			{return PLUS;}
"-"			{return MINUS;}
"/*"		{	
				char c = input();
				char later;
				while(later!='/'){
					if (c!='*'){
						c = input();
						continue;
					}
					c = input();
					if(c == '/'){
						later='/';
					}
				}
			}
"*"			{return STAR;}
"//"		{	
				char c = input();  
				while (c!='\n') 
				c = input(); 
			}
"/"			{return DIV;}
"%"			{return REM;}
"&&"    {return AND;}
"||"    {return OR;}
"!"			{return NOT;}
"["			{return LS;}
"]"			{return RS;}
"("			{return LP;}
")"			{return RP;}
"{"			{return LC;}
"}"			{return RC;}
"\'"		{printf("meet apos.\n");return APOS;}
"\""		{printf("meet quot.\n");return QUOT;}
[\n]           {yycolumn=1;}
[ \r\t]          {}
.			{printf("Error type A :Mysterious character \"%s\"\n\t at Line %d\n",yytext,yylineno);}/*作为实验内容，还需要考虑识别出2种形式的注释注释部分时，直接舍弃 */

%%

/* 和bison联用时，不需要这部分
void main()
{
yylex();
}

*/
int yywrap()
{
return 1;
}
