flex exp.l
bison -d exp.y
gcc -o parser lex.yy.c exp.tab.c ast.c -Wno-switch
./parser test.c