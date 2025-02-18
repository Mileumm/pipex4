/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipex.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tbahin <tbahin@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/19 12:54:55 by tbahin            #+#    #+#             */
/*   Updated: 2025/02/18 00:07:18 by tbahin           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef PIPEX_H
# define PIPEX_H

# include <unistd.h>
# include <string.h>
# include <sys/wait.h>
# include <stdlib.h>
# include <fcntl.h>
# include "../libft/libft.h"
# include "../libft/get_next_line.h"

typedef struct s_args
{
	char	*path;
	char	**cmd;
	char	**env;
}		t_args;

typedef struct s_env
{
	char	**av;
	char	**env;
	int		status;
}			t_env;

char	*ft_getenv(char *name, char **env);
char	*ft_getpath(char *name, char **path);
char	*ft_strjoin_pipex(char const *s1, char const *s2, char *sep);
char	*ft_strcat_pipex(char *dest, char *src);
int		ft_open(char *name, int rw);
char	*ft_findname(char *name);
void	ft_free_tab(char **tab);
// int		ft_manage_child(int ac, t_env en, int fd_final);
// int		ft_pipe(int nb_cmd, t_env env, int in, int out);
// int		ft_child(int file1, int file2, char *av_cmd, char **env);
// int		ft_child_here_doc(int file1, int file2, char *av_cmd, char **env);
// int		ft_manage6_child(int ac, t_env en, int fd_final);
void	ft_manage_pipe(char *cmd, t_env env);
void	ft_child(char *av_cmd, char **env);

#endif
