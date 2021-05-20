# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cgutierr <cgutierr@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/28 18:02:40 by cgutierr          #+#    #+#              #
#    Updated: 2021/05/20 16:42:04 by cgutierr         ###   ########.fr        #
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


NAME			=	libasm.a

SRCS			=	ft_strlen.s \
					ft_strcpy.s \
					ft_strcmp.s \
					ft_write.s \
					ft_read.s \
					ft_strdup.s

HEADER			=	libasm.h
					
OBJS			=	$(SRCS:.s=.o)

SC				=	nasm

S_FLAGS			=	-f macho64

FLAGS			=	-Wall -Werror -Wextra#-g3 -fsanitize=address

%.o:			%.s
				$(SC) $(S_FLAGS) $<

RM				=	rm -f

all:			$(NAME)

$(NAME):		$(OBJS)
				@echo $(YELLOW)Compiling libasm ... $(RESET)
				ar rcs $(NAME) $(OBJS)

#gcc $(FLAGS) main.c -c
#gcc main.o ft_strlen.o ft_strcpy.o ft_strcmp.o ft_write.o ft_read.o ft_strdup.o -o libasm.out	
exe:
				@echo $(GREEN)LIBASM TESTS$(RESET)
				gcc $(FLAGS) -L. -lasm -o libasm.out main.c
				./libasm.out			
bonus:
				@echo $(RED)Haha nope ... $(RESET)

clean:
				$(RM) $(OBJS) ./libasm.out main.o

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
					
.PHONY:			all clean fclean re