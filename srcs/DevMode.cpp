#include "../includes/DevMode.hpp"

DevMode::DevMode() { }

DevMode::DevMode(char **env, char * src_dir, char * incl_dir, char * makefile_path) : env_(env), src_dir_(src_dir), incl_dir_(incl_dir), makefile_path_(makefile_path) {
}

DevMode::~DevMode() { }

void                    DevMode::checkChangesInFile() {
    FileWatcher fw{src_dir_, incl_dir_, std::chrono::milliseconds(50)};

    // Start monitoring a folder for changes and (in case of changes)
    // run a user provided lambda function
    fw.start([&] (std::string path_to_watch, FileStatus status) -> void {
        // Process only regular files, all other file types are ignored
        if(!std::filesystem::is_regular_file(std::filesystem::path(path_to_watch)) && status != FileStatus::erased) {
            return;
        }

        switch(status) {
            case FileStatus::created:
                // std::cout << "File created: " << path_to_watch << '\n';
                executeMake();
                break;
            case FileStatus::modified:
                // std::cout << "File modified: " << path_to_watch << '\n';
                executeMake();
                break;
            case FileStatus::erased:
                // std::cout << "File erased: " << path_to_watch << '\n';
                executeMake();
                break;
            default:
                std::cout << "Error! Unknown file status.\n";
        }
    });
}

std::vector<STRING>     const & DevMode::getFileNames() const {
    return (filePaths_);
}

int    DevMode::executeMake() {
    char **newargv;

    newargv = new char*[2];
    newargv[0] = strdup("make");
    newargv[1] = strdup("re");
    newargv[2] = NULL;

    chdir(makefile_path_.c_str());

    execve("/usr/bin/make", newargv, env_);
    perror("execve");
    delete newargv[0];
    delete newargv[1];
    delete[] newargv;
    return (0);
}
