/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cgutierr <cgutierr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/28 19:03:36 by cgutierr          #+#    #+#             */
/*   Updated: 2021/04/28 19:45:57 by cgutierr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */


/*
COMPILAR -> nasm -f macho64 ft_strlen.s
gcc main.c -c
cc main.o ft_strlen.o
./a.out

nasm -f macho64 ft_write.s && gcc main.c -c && gcc main.o ft_strlen.o ft_write.o && ./a.out
*/
#include <stdio.h>
int ft_strlen(char *str);
ssize_t ft_write(int fd, char * cbuf, ssize_t nbyte);
ssize_t read(int fd, char * cbuf, ssize_t nbyte);




int main()
{
	// FT_STRLEN
	char *sopita = "sopita\n";
	int len =ft_strlen(sopita);
	printf("Len = %d\n", len);
	fflush(stdout);
	// FT_WRITE
	ft_write(1, sopita, len);
	if(ft_write(-1, sopita, len) == -1)
	{
		perror("Error");
	}


	//FT_WRITE
	char buffer[15];
	
	int nbytes =read(1,buffer,15);

	printf("N Bytes del read = %d || STRING = %s\n", nbytes, buffer);
	fflush(stdout);
	return 0;
}