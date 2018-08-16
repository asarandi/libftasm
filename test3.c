#include <stdio.h>
#include <strings.h>


int main()
{
		char	str[50];
		int		num;
		long	lnum;

		bzero(&str, 50);



		num = 0x7fffffff;
		num += 1;
		lnum = 0x4545343423231212;

		num = (int)lnum;

		num = 0 - 0x80000000;
		num -= 1;
		sprintf(str, "%d", num);

		printf("%s\n", str);
		return (0);
}
