NAME = libfts.a
ASM = nasm
ASM_FLAGS = -g
FILE_NAMES = ft_atoi ft_bzero ft_cat ft_itoa ft_isalnum ft_isalpha ft_isascii ft_isdigit ft_islower ft_isprint ft_isspace ft_isupper ft_memcpy ft_memset ft_puts ft_strcat ft_strcmp ft_strdup ft_strlen ft_tolower ft_toupper

UNAME := $(shell uname -s)
SRC_DIR := src/$(UNAME)/

OBJ_DIR = obj/
OBJ_DIR_OS = $(OBJ_DIR)$(UNAME)/
OBJ_FILES = $(addprefix $(OBJ_DIR_OS), $(addsuffix .o, $(FILE_NAMES)))


ifeq ($(UNAME),Linux)
	ASM_FLAGS += -f elf64
else ifeq ($(UNAME),Darwin)
	ASM_FLAGS += -f macho64
endif

all: $(NAME)

$(NAME): $(OBJ_FILES)
	ar -rs $@ $^

$(OBJ_FILES): $(OBJ_DIR_OS)%.o : $(SRC_DIR)%.s | $(OBJ_DIR_OS)
	$(ASM) $(ASM_FLAGS) $^ -o $@

$(OBJ_DIR_OS): | $(OBJ_DIR)
	mkdir -p $@

$(OBJ_DIR):
	mkdir -p $@

clean:
	rm -rf $(OBJ_DIR)

fclean: clean testrm
	@rm -rf a.out*
	rm -f $(NAME)

re: fclean all

list:
	@ls -1 $(SRC_DIR)*.s | sed 's/.*\///' | sed 's/\.s//' | tr '\n' ' '

test1: $(NAME)
	rm -rf test1*;
	gcc -o isX_tests -g tests/isX_tests.c -Iinc/ -L. -lfts
	@echo ""
	@echo ""
	@echo "done, run ./isX_tests   .... no verbose output, maybe look in source file: tests/isX_tests.c"

test2: $(NAME)
	rm -rf itoa_test*;
	gcc -o itoa_test -g tests/itoa_test.c -Iinc/ -L. -lfts

test3: $(NAME)
	rm -rf cat_test*;
	gcc -o cat_test -g tests/cat_test.c -Iinc/ -L. -lfts

test4: $(NAME)
	rm -rf atoi_test*;
	gcc -o atoi_test -g tests/atoi_test.c -Iinc/ -L. -lfts

test5: $(NAME)
	rm -rf str_test*;
	gcc -o str_test -g tests/str_test.c -Iinc/ -L. -lfts

fctest: $(NAME)
	git clone https://github.com/jgigault/42FileChecker 42FC
	bash 42FC/42FileChecker.sh --project "libftasm" --path `pwd`

testfc: fctest

testall: test1 test2 test3 test4 test5

alltest: testall
alltests: testall

testrm:
	rm -rf 42FC
	rm -rf isX_tests*
	rm -rf itoa_test*
	rm -rf cat_test*
	rm -rf atoi_test*
	rm -rf str_test*

rmtest: testrm
rmtests: testrm
