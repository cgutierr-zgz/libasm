# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cgutierr <cgutierr@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/28 18:02:40 by cgutierr          #+#    #+#              #
#    Updated: 2021/04/28 18:08:57 by cgutierr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DAY			=	$(shell date +'%d/%m/%Y %H:%M')
# Obligatorio: $(NAME), all, clean, fclean y re.
# Bonus: Regla bonus + _bonus.{c/h}
# asm 64 bits | archivos .s | compilar con nasm
# Usar sintaxis de Intal y no de AT&T
# Debe entregar un main que probará las funciones y compilará con la biblioteca para mostrar que funciona
#• Debe verificar los errores durante las syscalls et reenviarlas correctamente.
#Vuestro código debe permitir la lectura de la variable errno (de <errno.h>) desde un fichero .c
#Para esto, está autorizado extern ___error


# Escribir:
#	◦ ft_strlen (man 3 strlen)
#	◦ ft_strcpy (man 3 strcpy)
#	◦ ft_strcmp (man 3 strcmp)
#	◦ ft_write (man 2 write)
#	◦ ft_read (man 2 read)
#	◦ ft_strdup (man 3 strdup, se autoriza malloc)

# Puede volver a escribir las funciones siguientes en asm: La lista enlazada utilizará la
# estructura siguiente:
#	typedef struct s_list
#	{
#		void *data;
#		struct s_list *next;
#	}	t_list;
# Extra:
#• ft_atoi_base (Como la de la piscina)
#• ft_list_push_front (Como la de la piscina)
#• ft_list_size (Como la de la piscina)
#• ft_list_sort (Como la de la piscina)
#• ft_list_remove_if (Como la de la piscina)


NAME		=	libasm.a



SRCS			=	ft_memset.c ft_strrchr.c \
					ft_bzero.c ft_strnstr.c \
					ft_memcpy.c ft_strncmp.c \
					ft_memccpy.c ft_atoi.c \
					ft_memmove.c ft_isalpha.c \
					ft_memchr.c ft_isdigit.c \
					ft_memcmp.c ft_isalnum.c \
					ft_strlen.c ft_isascii.c \
					ft_strlcpy.c ft_isprint.c \
					ft_strlcat.c ft_toupper.c \
					ft_strchr.c ft_tolower.c \
					ft_calloc.c ft_strdup.c \
					ft_substr.c \
					ft_strjoin.c \
					ft_strtrim.c \
					ft_split.c \
					ft_itoa.c \
					ft_strmapi.c \
					ft_putchar_fd.c \
					ft_putstr_fd.c \
					ft_putendl_fd.c \
					ft_putnbr_fd.c 

BONUS			=	ft_lstnew.c \
					ft_lstadd_front.c \
					ft_lstsize.c \
					ft_lstlast.c \
					ft_lstadd_back.c \
					ft_lstdelone.c \
					ft_lstclear.c \
					ft_lstiter.c \
					ft_lstmap.c 

HEADER			=	libft.h
					
OBJS			=	$(SRCS:.c=.o)

BONUS_OBJS		=	$(BONUS:.c=.o)

CC				=	gcc

FLAGS			=	-Wall -Werror -Wextra

RM				=	rm -f

all:			$(NAME)

$(NAME):
				$(CC) $(FLAGS) -I $(HEADER) -c $(SRCS)
				ar -rc $(NAME) $(OBJS)
				ranlib $(NAME)

bonus:
				$(CC) $(FLAGS) -I $(HEADER) -c $(BONUS)
				ar -rc $(NAME) $(BONUS_OBJS)
				ranlib $(NAME)

clean:
				$(RM) $(OBJS) $(BONUS_OBJS)

fclean:			clean
				$(RM) $(NAME)

re:				fclean all




#Colors
BLACK		:="\033[0;30m"
RED			:="\033[0;31m"
GREEN		:="\033[0;32m"
BROWN		:="\033[0;33m"
BLUE		:="\033[0;34m"
PURPLE		:="\033[0;35m"
CYAN		:="\033[0;36m"
LIGHT_GRAY	:="\033[0;37m"
DARK_GRAY	:="\033[1;30m"
LIGHT_RED	:="\033[1;31m"
LIGHT_GREEN	:="\033[1;32m"
YELLOW		:="\033[1;33m"
LIGHT_BLUE	:="\033[1;34m"
LIGHT_PURPLE:="\033[1;35m"
LIGHT_CYAN	:="\033[1;36m"
WHITE		:="\033[1;37m"
RESET		:="\x1b[0m"

#Easily push content to our repo
git:
				@echo $(YELLOW)Status:$(RESET)
				@git status || true 
				@echo $(YELLOW)GIT add ... $(RESET)
				@git add . || true 
				@echo $(YELLOW)GIT commit ... $(RESET)
				@git commit -m "$(DAY)" || true 
				@echo $(YELLOW)GIT push ... $(RESET)
				@git push -u origin master || true 

#Easily check the norm
norminette:
				@echo $(YELLOW)Norminette...
				@echo $(GREEN)
				@norminette $(SRCS) $(SRCS_B) $(HEADER) $(HEADER_B) ./libft/*.c ./libft/*.h | grep 'OK' || true 
				@echo $(RED)
				@norminette $(SRCS) $(SRCS_B) $(HEADER) $(HEADER_B) ./libft/*.c ./libft/*.h | grep 'Error!\|line:' || true
						
.PHONY:			all clean fclean re