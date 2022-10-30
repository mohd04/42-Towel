#include "../includes/DevMode.hpp"

DevMode::DevMode() { }

DevMode::DevMode(char **env) : env_(env) {
}

DevMode::~DevMode() { }

void                    DevMode::checkChangesInFile() {
    FileWatcher fw{"./", std::chrono::milliseconds(50)};

    // Start monitoring a folder for changes and (in case of changes)
    // run a user provided lambda function
    fw.start([&] (std::string path_to_watch, FileStatus status) -> void {
        // Process only regular files, all other file types are ignored
        if(!std::filesystem::is_regular_file(std::filesystem::path(path_to_watch)) && status != FileStatus::erased) {
            return;
        }

        switch(status) {
            case FileStatus::created:
                std::cout << "File created: " << path_to_watch << '\n';
                executeMake("make", "");
                break;
            case FileStatus::modified:
                std::cout << "File modified: " << path_to_watch << '\n';
                executeMake("make", "re");
                break;
            case FileStatus::erased:
                std::cout << "File erased: " << path_to_watch << '\n';
                executeMake("make", "");
                break;
            default:
                std::cout << "Error! Unknown file status.\n";
        }
    });
}

std::vector<STRING>     const & DevMode::getFileNames() const {
    return (filePaths_);
}

int    DevMode::executeMake(STRING command, STRING commandTwo) {
    char **newargv;

    if (commandTwo.empty()) {
        newargv = new char*[1];
        newargv[0] = strdup("make");
        newargv[1] = NULL;
    }
    else {
        newargv = new char*[2];
        newargv[0] = strdup("make");
        newargv[1] = strdup("re");
        newargv[2] = NULL;
    }
    execve("/usr/bin/make", newargv, env_);
    perror("execve");
    // exit(EXIT_FAILURE);
    return (0);
}
