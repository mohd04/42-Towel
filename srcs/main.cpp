#include "../includes/DevMode.hpp"

int main(int ac, char **av, char **env) {
    if (ac != 3) {
        std::cerr << "Wrong number of arguments" << std::endl;
    }
    DevMode dev(env, av[1], av[2]);

    dev.checkChangesInFile();
}
