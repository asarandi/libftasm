#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>

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

	printf("\n\n");



	char	*n1;

	n1 = "123"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "-123"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "0"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "-0"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "+0"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "  	+7642"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "	+ 1942"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "  -1042"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "  - 1242"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "1142--"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));


	n1 = "++42"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "--42"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "-+42"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "+-42"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "123456789"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "-123456789"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "999999999999999"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));

	n1 = "–2147483648"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "–2147483649"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));


	n1 = "2147483647"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "2147483649"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));


	n1 = "4294967294"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "4294967295"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "4294967296"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));
	n1 = "4294967297"; printf("ft_atoi(\"%s\") = %d,  atoi(\"%s\") = %d \n", n1, ft_atoi(n1), n1, atoi(n1));


	int poots = ft_puts("hello world");
	printf(" ^^ previous string via ft_puts, returned = %d\n", poots);

	char s4[] = "apple banana orange";
	ft_puts(s4);
	ft_memset(s4, 'z', 9); 	ft_puts(s4);
	ft_memset(s4, 'a', 5);	ft_puts(s4);
	ft_memset(s4, 'Q', 1); ft_puts(s4);
//	ft_memset(s4, 0, 12); ft_puts(s4);
	ft_bzero(s4, ft_strlen(s4)); ft_puts(s4);
	ft_puts("finito");


	ft_puts("");
//	ft_puts(0);	/* crash */
	ft_puts("hel\tlo\t\t\twor\tld!!=)");

































	return 0;
}
