################################################################################
#                                PROJECT'S INFO                                #
################################################################################
Intra_Login = bnaji

PROJECT_NAME = TOWEL

DATE = 29 - 10 - 2022

################################################################################
#                                    COLORS                                    #
################################################################################
PURPLE			= \033[1;35m
BLUE			= \033[1;34m
WHITE			= \033[1;37m
LIGHT_BLUE		= \033[1;36m
GREEN			= \033[1;32m
RED				= \033[1;31m
BYELLOW			= \033[1;33m
IYELLOW			= \033[3;33m
LIGHT_GREEN		= \033[38;5;46m
GREY 			= \033[38;5;8m
ORANGE 			= \033[38;5;202m
RESET	  		= \033[m
BGBLUE			= \033[46;5;1m


################################################################################
#                             DIRECTORIES STRUCTURE                            #
################################################################################

########
# SRCS #
########

SRCS_DIR = srcs/

############
# INCLUDES #
############

INCLUDES_DIR = includes/

###########
# OBJECTS #
###########

OBJS_DIR = objs/

##############
# SRCS FILES #
##############

SRCS_FILES = main.c

##############
# OBJS FILES #
##############

OBJS_FILES = $(addprefix $(OBJS_DIR), ${SRCS_FILES:%.c=%.o})

################################################################################
#                               COMPILATION VARS                               #
################################################################################

CXX = gcc

FILE_TYPE = c

CXX_FLAGS = -Wall -Wextra -Werror

NAME = test

###########
###########
######################
######################
################################################################################
################################################################################
#                                    RULES                                     #
################################################################################
################################################################################

all: header $(NAME) footer

$(NAME): CREATE_OBJS_DIR $(OBJS_FILES)
	@$(CXX) ${CXX_FLAGS} $(OBJS_FILES) -o $(NAME)
	@echo "\n\r\033[3A\033[0K\t$(RESET)[$(GREEN)✓$(RESET)]   $(IYELLOW)DONE\n$(RESET)"

CREATE_OBJS_DIR:
	@mkdir -p $(OBJS_DIR)

$(OBJS_DIR)%.o : $(SRCS_DIR)%.c
	@echo "\n\r\033[3A\033[0K\t$(RESET)[$(GREEN)✓$(RESET)]   $(IYELLOW)generating $@\n$(RESET)"
	@$(CXX) ${CXX_FLAGS} -c $< -o $@

header:
	@printf "\n%b" "$(RESET)"
	@echo
	@printf "\t\t\t$(PURPLE)#################################################################\n\n$(RESET)"
	@printf "\t\t\t\t$(LIGHT_BLUE)Intra Login\t\t:\t\t$(WHITE)%b\n$(RESET)" "$(Intra_Login)"
	@printf "\t\t\t\t$(LIGHT_BLUE)NAME\t\t\t:\t\t$(WHITE)%b\n$(RESET)" "$(PROJECT_NAME)"
	@printf "\t\t\t\t$(LIGHT_BLUE)DATE\t\t\t:\t\t$(WHITE)%b\n\n$(RESET)" "$(DATE)"
	@printf "\t\t\t$(PURPLE)#################################################################\n\n$(RESET)"
	@echo "\t$(BYELLOW)LOADING...$(RESET)\n"

footer:
	@echo "$(BYELLOW)⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡"
	@echo "$(BYELLOW)⚡\t\t\t\t\t$(BYELLOW)READY\t\t\t\t\t\t$(BYELLOW)⚡"
	@echo "$(BYELLOW)⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡$(RESET)"

clean_o_files:
	@rm -rf $(OBJS_DIR)
	@echo "\n\t$(RESET)[$(GREEN)✓$(RESET)]   $(IYELLOW)object files are Deleted\n$(RESET)"

clean_exec_file:
	@rm -rf $(NAME)
	@echo "\n\t$(RESET)[$(GREEN)✓$(RESET)]   $(IYELLOW)Executable file is Deleted\n$(RESET)"

clean: header clean_o_files footer

fclean: header clean_o_files clean_exec_file footer

destroyall: fclean
	@rm -rf $(SRCS_DIR)
	@rm -rf $(INCLUDES_DIR)

re: header clean_o_files clean_exec_file $(NAME) footer

.PHONY: all clean fclean re