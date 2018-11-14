#!/bin/bash
nasm -f elf64 libftasm.asm -o libftasm.o
#ld -fPIC -shared libftasm.o -lc -o tralala -I/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
#gcc -shared -fPIC libftasm.o -lc
ar rcs libftasm.a libftasm.o
#rm -f libftasm.o
gcc -g test1.c libftasm.a -lc -o result

