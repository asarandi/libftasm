#include <stdio.h>
#include <ctype.h>
#include <string.h>

#include "libftasm.h"


int	main(void)
{
	int	c;
/*

ft_strlen
ft_bzero
ft_strcat
ft_puts

*/
	c = 0;
	while (c <= 300)
	{
		printf(" c = %d, ft_isupper(c) = %d\tisupper(c) = %d\n", c, ft_isupper(c), isupper(c));
		printf(" c = %d, ft_islower(c) = %d\tislower(c) = %d\n", c, ft_islower(c), islower(c));
		printf(" c = %d, ft_isalpha(c) = %d\tisalpha(c) = %d\n", c, ft_isalpha(c), isalpha(c));
		printf(" c = %d, ft_isdigit(c) = %d\tisdigit(c) = %d\n", c, ft_isdigit(c), isdigit(c));
		printf(" c = %d, ft_isalnum(c) = %d\tisalnum(c) = %d\n", c, ft_isalnum(c), isalnum(c));
		printf(" c = %d, ft_isascii(c) = %d\tisascii(c) = %d\n", c, ft_isascii(c), isascii(c));
		printf(" c = %d, ft_isprint(c) = %d\tisprint(c) = %d\n", c, ft_isprint(c), isprint(c));
		printf(" c = %d, ft_toupper(c) = %d\ttoupper(c) = %d\n", c, ft_toupper(c), toupper(c));
		printf(" c = %d, ft_tolower(c) = %d\ttolower(c) = %d\n", c, ft_tolower(c), tolower(c));

		c++;
	}



	char	*s1 = "";
	char	*s2 = "hello";
	char	*s3 = "hello  world !! ! !      ";

	printf("ft_strlen(s1) = %ld, strlen(s1) = %ld, s1 = [%s]\n", ft_strlen(s1), strlen(s1), s1);
	printf("ft_strlen(s2) = %ld, strlen(s2) = %ld, s2 = [%s]\n", ft_strlen(s2), strlen(s2), s2);
	printf("ft_strlen(s3) = %ld, strlen(s3) = %ld, s3 = [%s]\n", ft_strlen(s3), strlen(s3), s3);



	return 0;
}
