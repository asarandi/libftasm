#ifndef LIBFTASM_H
# define LIBFTASM_H

size_t	ft_strlen(const char *s);
void	ft_bzero(void *s, size_t n);
void	*ft_memset(void *s, int c, size_t n);
void	*ft_memcpy(void *dest, const void *src, size_t n);
char	*ft_strcat(char *dest, const char *src);
int		ft_isalnum(int c);
int		ft_isalpha(int c);
int		ft_isdigit(int c);
int		ft_islower(int c);
int		ft_isprint(int c);
int		ft_isupper(int c);
int		ft_isascii(int c);
int		ft_toupper(int c);
int		ft_tolower(int c);
int		ft_putchar(int c);
int		ft_puts(const char *s);
int		ft_isspace(int c);
int		ft_atoi(const char *nptr);
int		ft_mytest(int a, int b, int c, int d, int e, int f, int g, int h);

#endif
