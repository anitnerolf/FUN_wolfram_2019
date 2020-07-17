##
## EPITECH PROJECT, 2020
## 202unsold
## File description:
## makefile
##

SRC	=	main.hs

OBJ	=	$(SRC:.hs=.o)

HI	=	$(SRC:.hs=.hi)

NAME	=	wolfram

all:		$(NAME) message

$(NAME):	$(SRC)
		ghc -o $(NAME) $(SRC)

clean:
		rm -f $(OBJ)

fclean:		clean
		rm -f $(NAME) *~ $(HI)

re:		fclean all

message:
		@echo "Successfully compiled!"
