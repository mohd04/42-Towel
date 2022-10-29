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

# define STRING std::string

class DevMode {
    private:
        std::vector<STRING>             filePaths_;
        int                             fdIn[2];
        int                             fdOut[2];
        pid_t                           pid;
        char**                          env_;

    public:
        DevMode();
        ~DevMode();

        std::vector<STRING> const &  getFileNames() const;

        void                         setFilePaths(STRING dirName);
        void                         setDirPaths();

        void                         checkChangesInFile();
        int                          execute(STRING command);
        int                          parentProcess();
        void                         childProcess(STRING command);
};

#endif
