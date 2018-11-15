NAME = libfts.a
ASM = nasm
ASM_FLAGS = -g
FILE_NAMES = ft_cat ft_bzero ft_isalnum ft_isalpha ft_isascii ft_isdigit ft_islower ft_isprint ft_isupper ft_memcpy ft_memset ft_puts ft_strcat ft_strdup ft_strlen ft_tolower ft_toupper

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

fclean: clean
	rm -f $(NAME)

re: fclean all

list:
	@ls -1 $(SRC_DIR)*.s | sed 's/src\///' | sed 's/\.s//' | tr '\n' ' '
test:
	rm -f a.out; gcc -g test1.c -lfts -L.
