#ifndef DEVMODE_HPP
# define DEVMODE_HPP

#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
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
        char *                          newargv[];

    public:
        DevMode();
        DevMode(char ** env);
        ~DevMode();

        std::vector<STRING> const &  getFileNames() const;

        void                         setFilePaths(STRING dirName);
        void                         setDirPaths();

        void                         checkChangesInFile();
        int                          executeMake(STRING command);
        int                          parentProcess();
        void                         childProcess(STRING command);
};

#endif
