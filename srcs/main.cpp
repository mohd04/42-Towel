#include "../includes/DevMode.hpp"

int main(int ac, char **av, char **env) {
    if (ac != 4) {
        std::cerr << "Wrong number of arguments" << std::endl;
        return (1);
    }
    DevMode dev(env, av[1], av[2], av[3]);

    dev.checkChangesInFile();
}
