NAME = libfts.a
ASM = nasm
ASM_FLAGS = -g -f macho64
FILE_NAMES = ft_bzero ft_isalnum ft_isalpha ft_isascii ft_isdigit ft_islower ft_isprint ft_isupper ft_memcpy ft_memset ft_puts ft_strcat ft_strdup ft_strlen ft_tolower ft_toupper
SRC_DIR = src/
SRC_FILES = $(addprefix $(SRC_FIR), $(addprefix .s, $(FILE_NAMES)))
OBJ_DIR = obj/
OBJ_FILES = $(addprefix $(OBJ_DIR), $(addsuffix .o, $(FILE_NAMES)))

all: $(NAME)

$(NAME): $(OBJ_FILES)
	ar -rs $@ $^

$(OBJ_FILES): $(OBJ_DIR)%.o : $(SRC_DIR)%.s | $(OBJ_DIR)
	$(ASM) $(ASM_FLAGS) $^ -o $@

$(OBJ_DIR):
	mkdir -p $@

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

list:
	@ls -1 *.s | sed 's/\.s//' | tr '\n' ' '
test:
	rm -f a.out; gcc -g test1.c -lfts -L.
