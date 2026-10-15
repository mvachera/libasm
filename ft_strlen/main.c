#include <stdio.h>
#include <string.h>

size_t	ft_strlen(const char *s);

int main() {
	char str[] = "yes";

	printf("%zu\n", ft_strlen(str));
}