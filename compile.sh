#!/bin/bash
nasm -f elf64 libftasm.asm -o libftasm.o
ar rcs libftasm.a libftasm.o
rm -f libftasm.o
cc test1.c libftasm.a -o result

