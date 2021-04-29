/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cgutierr <cgutierr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/28 19:03:36 by cgutierr          #+#    #+#             */
/*   Updated: 2021/04/29 18:34:38 by cgutierr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>

/*
** Compilar:
**	nasm -f macho64 ft_strlen.s && nasm -f macho64 ft_strcpy.s && nasm -f macho64 ft_strcmp.s && nasm -f macho64 ft_write.s && nasm -f macho64 ft_read.s && nasm -f macho64 ft_strdup.s
**	gcc main.c -c
**	gcc main.o ft_strlen.o ft_strcpy.o ft_strcmp.o ft_write.o ft_read.o ft_strdup.o
*/

size_t	ft_strlen(const char *s);
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
size_t	ft_write(int fd, char *cbuf, size_t nbyte);
size_t	ft_read(int fd, char *cbuf, size_t nbyte);
char	*ft_strdup(const char *s1);

int	main()
{ //TODO: meter originales
	// ft_strlen
	char *string = "Prueba de write";
	size_t len = ft_strlen(string);
	printf("ft_strlen\nString=%s|Len=%zu\n", string, len);
	fflush(stdout);

	// FT_WRITE
	ft_write(1, string, len);
	if (ft_write(-1, string, len) == -1)
	{
		perror("Error");
	}

	//FT_STRCPY
	char *o_str1 = strdup("sopa");
	char *o_str2 = strdup("sopita");
	printf("Antes=[%s]\n", o_str2);
	printf("Strcpy=[%s]\n", strcpy(o_str2, o_str1));

	char *str1 = strdup("sopa");
	char *str2 = strdup("sopita");
	printf("Antes=[%s]\n", str2);
	printf("ft_Strcpy=[%s]\n", ft_strcpy(str2, str1));

	//FT_STRCMP
	printf("strcmp=%d\n", strcmp("Soph", "Sopa"));
	printf("ft_strcmp=%d\n", ft_strcmp("A", "a"));

	//FT_WREAD
	char buffer[15];

	int nbytes = ft_read(1, buffer, 15);

	printf("N Bytes del read = %d || STRING = %s\n", nbytes, buffer);
	//fflush(stdout);
	nbytes = ft_read(-1, buffer, 15);
	if (nbytes == -1)
	{
		perror("Error");
	}
	return 0;
}
