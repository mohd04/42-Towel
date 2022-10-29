#include "../includes/DevMode.hpp"

DevMode::DevMode(char **env) : env_(env) {
    this->setDirPaths();
}

DevMode::~DevMode() { }

void                    DevMode::checkChangesInFile() {
    struct stat info;

    std::vector<time_t> currentTime;
    std::vector<time_t> oldTime;

    while (true) {
        oldTime = currentTime;
        for (size_t it = 0; it < filePaths_.size(); it++) {
            stat(filePaths_[it].c_str(), &info);
            currentTime.push_back(info.st_mtime);
        }
        if (currentTime != oldTime)
            std::cout << "DIFFERENT" << std::endl;
    }
}

std::vector<STRING>     const & DevMode::getFileNames() const {
    return (filePaths_);
}

void                    DevMode::setFilePaths(STRING dirName) {
    DIR     *dir;
    STRING  name;
    STRING  path;

    char    cwd[PATH_MAX];

    getcwd(cwd, sizeof(cwd));

    path = cwd;
    path = path.substr(0, path.find_last_of("/") + 1);

    struct dirent *ent;
    if ((dir = opendir (dirName.c_str())) != NULL) {
        while ((ent = readdir (dir)) != NULL) {
            name = ent->d_name;
            if (name == "." || name == "..")
                continue ;
            filePaths_.push_back(path + name);
        }
        closedir (dir);
    } else {
        perror ("Could not open directory");
    }
}

void                    DevMode::setDirPaths() {
    this->setFilePaths(".");
    this->setFilePaths("../includes");
}

void    DevMode::childProcess(STRING command) {
    dup2(fdOut[1], STDOUT_FILENO);
    close(fdOut[0]);
    close(fdOut[1]);

    dup2(fdIn[0], STDIN_FILENO);
    close(fdIn[0]);
    close(fdIn[1]);

    chdir(pathArgs_[1]);

    if (execve(command.c_str(), pathArgs_, env_) < 0)
        exit(EXIT_FAILURE);
}

int    DevMode::parentProcess() {
    close(fdOut[1]);
    close(fdIn[1]);
    close(fdIn[0]);

    int status = 0;
    waitpid(pid, &status, 0);
    if (WIFEXITED(status) && WEXITSTATUS(status) == -1)
        write(1, "Error", 5);

    close(fdOut[0]);
    return (1);
}

int    DevMode::execute(STRING command) {
    /*
    pathArgs_ 0 = cgi path
    pathArgs_ 1 = file path
    */
    if (pipe(fdOut) < 0 || pipe(fdIn) < 0)
        exit(EXIT_FAILURE);

    pid = fork();

    if (!pid)
        childProcess();
    else if (pid > 0)
        return (parentProcess(command));
    else if (pid < 0) {
        close(fdOut[1]);
        close(fdOut[0]);
        close(fdIn[0]);
        close(fdIn[1]);
        std::cout << "Error" << std::endl;
        return (-1);
        // throw   std::exception("Fork failed.")
    }
    return (0);
}
