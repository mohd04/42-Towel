#include "../includes/DevMode.hpp"

int main(int ac, char **av, char **env) {
    DevMode dev(env);

    dev.checkChangesInFile();
}
