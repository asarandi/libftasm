#include <unistd.h>

int	ft_strlen(char *s)
{
	int i = 0;
	while (s[i])
		i++;
	return (i);
}

int	ft_puts(char *s)
{
	int	len;
	int	res1;
	int res2;

	res1 = 0;

	if ((len = ft_strlen(s)) > 0)
	{
		res1 = write(1, s, len);
		if (res1 == -1)
			return (res1);
	}
	res2 = write(1, "\n", 1);
	if (res2 == -1)
		return (res2);
	return (res1 + res2);
}

int	main()
{
	char *a = "hello world!";
	ft_puts(a);
	return (0);
}
