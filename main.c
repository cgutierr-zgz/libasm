/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cgutierr <cgutierr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/28 19:03:36 by cgutierr          #+#    #+#             */
/*   Updated: 2021/05/03 15:58:02 by cgutierr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <unistd.h>

/*
** Compilar:
**	nasm -f macho64 ft_strlen.s && nasm -f macho64 ft_strcpy.s && nasm -f macho64 ft_strcmp.s && nasm -f macho64 ft_write.s && nasm -f macho64 ft_read.s && nasm -f macho64 ft_strdup.s
**	gcc main.c -c
**	gcc main.o ft_strlen.o ft_strcpy.o ft_strcmp.o ft_write.o ft_read.o ft_strdup.o
**	./a.out
nasm -f macho64 ft_strlen.s && nasm -f macho64 ft_strcpy.s && nasm -f macho64 ft_strcmp.s && nasm -f macho64 ft_write.s && nasm -f macho64 ft_read.s && nasm -f macho64 ft_strdup.s && gcc main.c -c && gcc main.o ft_strlen.o ft_strcpy.o ft_strcmp.o ft_write.o ft_read.o ft_strdup.o && ./a.out
*/

size_t	ft_strlen(const char *s);
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
size_t	ft_write(int fd, char *cbuf, size_t nbyte);
size_t	ft_read(int fd, char *cbuf, size_t nbyte);
char	*ft_strdup(const char *s1);

int	main()
{
	// FT_STRLEN
	char *string = "Prueba de write";
	size_t len = ft_strlen(string);
	printf("**ft_strlen**\nString=%s|Len=%zu\n", string, len);
	// STRLEN
	len = strlen(string);
	printf("**strlen**\nString=%s|Len=%zu\n", string, len);
	fflush(stdout);

	// FT_WRITE
	printf("\n**ft_write**\n");
	fflush(stdout);
	ft_write(1, string, len);
	printf("\n");
	fflush(stdout);
	if (ft_write(-1, string, len) == -1)
		perror("Error");
	fflush(stdout);
	// WRITE
	printf("**write**\n");
	fflush(stdout);
	write(1, string, len);
	printf("\n");
	fflush(stdout);
	if (ft_write(-1, string, len) == -1)
		perror("Error");
	printf("\n");
	fflush(stdout);

	// FT_STRCPY
	char *str1 = strdup("sopa");
	char *str2 = strdup("sopita");
	printf("**ft_strcpy**\n");
	printf("Antes=[%s]<=%s\n", str2, str1);
	printf("Después=[%s]\n", ft_strcpy(str2, str1));
	// STRCPY
	char *o_str1 = strdup("sopa");
	char *o_str2 = strdup("sopita");
	printf("**strcpy**\n");
	printf("Antes=[%s]<=%s\n", o_str2, o_str1);
	printf("Después=[%s]\n", strcpy(o_str2, o_str1));


	// FT_STRCMP
	char *str1234 = "sopato";
	char *str234 = "sopa";
	printf("\n**ft_strcmp**\n%s,%s = %d\n", str1234, str234, ft_strcmp(str1234, str234));
	// STRCMP
	printf("**strcmp**\n%s,%s = %d\n\n", str1234, str234, strcmp(str1234, str234));

	// FT_STRDUP
	char *strtodup = "Duplicame esto";
	char *strtodupinto = NULL;
	char  *strtodupinto2 = NULL; 
	printf("\n**strdup**\n%s\t<=\t%s\n", strtodupinto ,strtodup);
	//strtodupinto = ft_strdup(strtodup);
	printf("%s\n", strtodupinto);
	// STRDUP
	printf("**strdup**\n%s\t<=\t%s\n", strtodupinto2 ,strtodup);
	strtodupinto2 = strdup(strtodup);
	printf("%s\n", strtodupinto2);


	// FT_READ
	char buffer2[15];
	printf("**ft_read**\n");
	fflush(stdout);
	int nbytes2 = ft_read(1, buffer2, 15);
	printf("N Bytes = %d || STRING = %s\n", nbytes2, buffer2);
	fflush(stdout);
	nbytes2 = ft_read(-1, buffer2, 15);
	if (nbytes2 == -1)
		perror("Error ft_read");
	// READ
	char buffer[15];
	printf("**read**\n");
	fflush(stdout);
	int nbytes = read(1, buffer, 15);
	printf("N Bytes = %d || STRING = %s\n", nbytes, buffer);
	fflush(stdout);
	nbytes = read(-1, buffer, 15);
	if (nbytes == -1)
		perror("Error read");

	return 0;
}
