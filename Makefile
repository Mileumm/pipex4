# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tbahin <tbahin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/07 16:04:41 by tbahin            #+#    #+#              #
#    Updated: 2025/02/17 21:41:48 by tbahin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = pipex

INCLUDE = ./includes/

CC = cc
CFLAG = -Wall -Wextra -Werror

SRCS =./srcs/pipex.c ./srcs/parsing.c ./srcs/outils.c ./srcs/multi_pipe.c

OBJS = ${SRCS:.c=.o}

all : ${NAME} 

${NAME} : $(OBJS)
	make bonus -C ./libft
	$(CC) $(CFLAG) -o $(NAME) $(OBJS) -L./libft -lft

%.o: %.c
	$(CC) $(CFLAG) -I $(INCLUDE) -c $< -o $@

clean :
	rm -f ${OBJS}
	make clean -C ./libft

fclean : clean
	rm -f ${NAME}
	make fclean -C ./libft

re : fclean all

.phony : all clean fclean re bonus
