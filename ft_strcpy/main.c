#include <stdio.h>
#include <string.h>

char	*ft_strcpy(char *dst, const char *src);

int main() {
	char src[] = "yes";
	char dst[100];

	ft_strcpy(dst, src);
	printf("%s\n", dst);
}