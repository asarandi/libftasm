#include <stdio.h>
#include "libfts.h"
#include <stdlib.h>

int main()
{
	int	array[] = {-2,-1,0,1,2,3,4,5, 42424242, 2147483647, -2147483648, 2147483649, 2147483650};
	int	n = sizeof(array) / sizeof(int);
	int i = 0;
	char *b = malloc(100);
	while (i < n)
	{
		char *a = ft_itoa(array[i]);
		sprintf(b, "%d", array[i]);
		printf("ft_itoa = %s, snprintf = %s\n", a, b);
		free(a);
		i++;
	}
	free(b);
	return (0);
}
