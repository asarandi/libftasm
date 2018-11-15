#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include "libfts.h"

/*
 * this test uses ft_strcmp, ft_isdigit, ft_atoi, ft_cat
*/

int main(int ac, char **av)
{
	if (ac > 1)
	{
		if (ft_strcmp(av[1], "0") == 0)
			ft_cat(0);
		else if (ft_isdigit(av[1][0]))
			ft_cat(ft_atoi(av[1]));
		else
		{
			int fd = open(av[1], O_RDONLY);
			if (fd == -1)
				printf("failed to open file: %s\n", av[1]);

			ft_cat(fd);
			close(fd);
		}
	}
	else
		printf("ft_cat-test: give me a file name,  '0` for stdin, or another number (for invalid fd)\n");
	
	return (0);
}
