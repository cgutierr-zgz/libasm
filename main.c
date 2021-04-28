/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cgutierr <cgutierr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/28 19:03:36 by cgutierr          #+#    #+#             */
/*   Updated: 2021/04/28 22:22:42 by cgutierr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

/*
**	Compilar:
**		nasm -f macho64 ft_strlen.s && nasm -f macho64 ft_write.s && nasm -f macho64 ft_read.s && ...
**		gcc main.c -c
**		gcc main.o ft_strlen.o ft_write.o ft_read.o
**		./a.out
*/

size_t ft_strlen(char *str);
size_t ft_write(int fd, char *cbuf, size_t nbyte);
size_t ft_read(int fd, char *cbuf, size_t nbyte);

int main()
{
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

	//FT_WRITE
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