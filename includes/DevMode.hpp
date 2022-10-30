#ifndef DEVMODE_HPP
# define DEVMODE_HPP

#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <time.h>
#include <stdio.h>
#include <dirent.h>
#include <sys/wait.h>
#include <limits.h>

#include <iostream>
#include <vector>
#include "FileWatcher.hpp"

# define STRING std::string

class DevMode {
    private:
        std::vector<STRING>             filePaths_;
        char**                          env_;
        STRING                          src_dir_;
        STRING                          incl_dir_;

    public:
        DevMode();
        DevMode(char ** env, char * src_dir, char * incl_dir);
        ~DevMode();

        std::vector<STRING> const &  getFileNames() const;

        void                         checkChangesInFile();
        int                          executeMake();
};

#endif
