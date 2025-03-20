# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tbahin <tbahin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/07 16:04:41 by tbahin            #+#    #+#              #
#    Updated: 2025/03/20 15:21:03 by tbahin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = pipex

INCLUDE = ./includes/

CC = cc
CFLAG = -Wall -Wextra -Werror

SRCS = ./srcs/pipex.c ./srcs/parsing.c ./srcs/outils.c ./srcs/multi_pipe.c

OBJDIR = ./objects
OBJS = $(SRCS:./srcs/%.c=$(OBJDIR)/%.o)

all: $(NAME)

$(NAME): $(OBJS)
	make bonus -C ./libft
	$(CC) $(CFLAG) -o $(NAME) $(OBJS) -L./libft -lft

$(OBJDIR)/%.o: ./srcs/%.c | $(OBJDIR)
	$(CC) $(CFLAG) -I $(INCLUDE) -c $< -o $@

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -f $(OBJS)
	make clean -C ./libft

fclean: clean
	rm -f $(NAME)
	make fclean -C ./libft
	rm -rf $(OBJDIR)

re: fclean all

.phony: all clean fclean re bonus
