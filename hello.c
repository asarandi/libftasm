#include <unistd.h>

void	*ft_memset(void *s, int c, size_t n)
{
	size_t			i;
	unsigned char	*m;

	m = s;
	i = 0;
	while (i < n)
		m[i++] = c;
	return (void *)(s);
}

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

int	main(int ac, char **av)
{
	char *a = "hello world!";
	if (ac == 2)
		ft_memset(av[1], 0x45464748, ft_strlen(av[1]));
	ft_puts(av[1]);
	return (0);
}
