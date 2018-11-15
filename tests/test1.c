#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include "libfts.h"

# define TEXT_RED		"\033[0;31m"
# define TEXT_GREEN		"\033[1;32m"
# define TEXT_EOC		"\033[0;00m"

/*
 *
 * this is a test for:
 *
 *
ft_isalnum.s
ft_isalpha.s
ft_isascii.s
ft_isdigit.s
ft_islower.s
ft_isprint.s
ft_isspace.s
ft_isupper.s
ft_tolower.s
ft_toupper.s
*/


int	main(void)
{

	int	c1;
	int	c2;

	int c0 = -10000;
	int errors = 0;
	while (c0 <= 10000)
	{
		c1 = ft_isalnum(c0); c2 = isalnum(c0);	//ALNUM
		if (c1 != c2)
		{
			printf( TEXT_RED "ERROR: " TEXT_EOC "ft_isalnum() = %d, isalnum() = %d\n", c1, c2);
			errors++;
		}

		c1 = ft_isalpha(c0); c2 = isalpha(c0);	//ALPHA
		if (c1 != c2)
		{
			printf( TEXT_RED "ERROR: " TEXT_EOC "ft_isalpha() = %d, isalpha() = %d\n", c1, c2);
			errors++;
		}

		c1 = ft_isascii(c0); c2 = isascii(c0);	//ASCII
		if (c1 != c2)
		{
			printf( TEXT_RED "ERROR: " TEXT_EOC "ft_isascii() = %d, isascii() = %d\n", c1, c2);
			errors++;
		}

		c1 = ft_isdigit(c0); c2 = isdigit(c0);	//DIGIT
		if (c1 != c2)
		{
			printf( TEXT_RED "ERROR: " TEXT_EOC "ft_digit() = %d, isdigit() = %d\n", c1, c2);
			errors++;
		}

		c1 = ft_islower(c0); c2 = islower(c0);	//LOWER
		if (c1 != c2)
		{
			printf( TEXT_RED "ERROR: " TEXT_EOC "ft_islower() = %d, islower() = %d\n", c1, c2);
			errors++;
		}

		c1 = ft_isprint(c0); c2 = isprint(c0);	//PRINT
		if (c1 != c2)
		{
			printf( TEXT_RED "ERROR: " TEXT_EOC "ft_isprint() = %d, isprint() = %d\n", c1, c2);
			errors++;
		}

		c1 = ft_isspace(c0); c2 = isspace(c0);	//SPACCE
		if (c1 != c2)
		{
			printf( TEXT_RED "ERROR: " TEXT_EOC "ft_isspace() = %d, isspace() = %d\n", c1, c2);
			errors++;
		}

		c1 = ft_isupper(c0); c2 = isupper(c0);	//UPPER
		if (c1 != c2)
		{
			printf( TEXT_RED "ERROR: " TEXT_EOC "ft_isupper() = %d, isupper() = %d\n", c1, c2);
			errors++;
		}

		c1 = ft_tolower(c0); c2 = tolower(c0);	//TO_LOWER
		if (c1 != c2)
		{
			printf( TEXT_RED "ERROR: " TEXT_EOC "ft_tolower() = %d, tolower() = %d\n", c1, c2);
			errors++;
		}

		c1 = ft_toupper(c0); c2 = toupper(c0);	//TO_UPPER
		if (c1 != c2)
		{
			printf( TEXT_RED "ERROR: " TEXT_EOC "ft_toupper() = %d, toupper() = %d\n", c1, c2);
			errors++;
		}

		c0++;
	}


	if (errors == 0)
		printf( TEXT_GREEN "all tests ok!\n" TEXT_EOC );



	return 0;
}
