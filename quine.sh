#!/bin/bash

cat <<EOF > quine.c && gcc ./quine.c -o quine && ./quine > thesame.c && DIFF=$(diff quine.c thesame.c) && [ "$DIFF" == "" ] && echo "Sources are identical"
#include <stdio.h>
char* _ = "#include <stdio.h>%cchar* _ = %c%s%c;%cint main(){printf(_,10,34,_,34,10,10);}%c";
int main(){printf(_,10,34,_,34,10,10);}
EOF
