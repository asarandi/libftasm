NAME = libfts.a
ASM = nasm
ASM_FLAGS = -f macho64
SRC_FILES = ft_bzero ft_isalnum ft_isalpha ft_isascii ft_isdigit ft_islower ft_isprint ft_isupper ft_puts ft_strlen ft_tolower ft_toupper
OBJ_FILES = $(addsuffix .o, $(SRC_FILES))

all: $(NAME)

$(NAME): $(OBJ_FILES)
	ar -rs $@ $^

$(OBJ_FILES): %.o : %.s
	$(ASM) $(ASM_FLAGS) $^

clean:
	rm -f $(OBJ_FILES)

fclean: clean
	rm -f $(NAME)

re: fclean all

list:
	@ls -1 *.s | sed 's/\.s//' | tr '\n' ' '
