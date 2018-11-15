#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>

#include "libfts.h"


int	main(void)
{

/*

ft_strlen
ft_bzero
ft_strcat
ft_puts

*/

	char	*s1 = "";
	char	*s2 = "hello";
	char	*s3 = "hello  world !! ! !      ";

	printf("ft_strlen(s1) = %ld, strlen(s1) = %ld, s1 = [%s]\n", ft_strlen(s1), strlen(s1), s1);
	printf("ft_strlen(s2) = %ld, strlen(s2) = %ld, s2 = [%s]\n", ft_strlen(s2), strlen(s2), s2);
	printf("ft_strlen(s3) = %ld, strlen(s3) = %ld, s3 = [%s]\n", ft_strlen(s3), strlen(s3), s3);
	printf("\n\n");



	int poots = ft_puts("hello world");
	printf(" ^^ previous string via ft_puts, returned = %d\n", poots);

	char s4[] = "apple banana orange";
	ft_puts(s4);

	ft_puts(ft_memset(s4, 'z', 9));
	ft_puts(ft_memset(s4, 'a', 5));
	ft_puts(ft_memset(s4, 'Q', 1));
	ft_puts(ft_memcpy(s4, "HaHeHoHu", 8));
	ft_puts(ft_memcpy(s4, s2, ft_strlen(s2)));
	ft_puts(ft_memcpy(s4, s2, 0));


	ft_memset(s4, 0, 12);
	ft_puts(s4);
	ft_bzero(s4, ft_strlen(s4));
	ft_puts(s4);
	ft_puts("finito");

	ft_puts("");
//	ft_puts(0);	/* crash */
	ft_puts("hel\tlo\t\t\twor\tld!!=)");

	char *original = "this is my original string";
	printf("str = [%s], mem address = [%p]\n", original, original);

	char *copy = ft_strdup(original);
	printf("str = [%s], mem address = [%p]\n", copy, copy);
	free(copy);




	char	*buf1;
	buf1 = ft_itoa(0x7fffffff + 2);
	ft_puts(buf1);



	return 0;
}
