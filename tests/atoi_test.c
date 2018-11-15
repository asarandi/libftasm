#include <stdio.h>
#include <stdlib.h>
#include "libfts.h"

# define TEXT_RED		"\033[0;31m"
# define TEXT_GREEN		"\033[1;32m"
# define TEXT_EOC		"\033[0;00m"

int main()
{
	char *ok = TEXT_GREEN	"ok"	TEXT_EOC;
	char *ko = TEXT_RED		"KO!"	TEXT_EOC;

	char *array[] = {
		"123",
		"-123",
		"0",
		"-0",
		"+0",
		"  	+7642",
		"	+ 1942",
		"  -1042",
		"  - 1242", 
		"1142--", "++42", 
		"--42", 
		"-+42", 
		"+-42", 
		"123456789", 
		"-123456789", 
		"999999999999999", 
		"–2147483648", 
		"–2147483649", 
		"2147483647", 
		"2147483649",
		"banana",
		"123banana",
		"-apple",
		"4294967294", 
		"4294967295", 
		"4294967296", 
		"4294967297"
	};

	int array_sz = sizeof(array) / sizeof(char *);
	int i = 0;
	while (i < array_sz)
	{
		int ft_res = ft_atoi(array[i]);
		int res = atoi(array[i]);
		char *status = (ft_res == res) ? ok : ko;
		printf("string = [%s],\tft_atoi() = [%d],\tatoi() = [%d],\tresult = [%s]\n", array[i], ft_res, res, status);
		i++;
	}
	return (0);
}
