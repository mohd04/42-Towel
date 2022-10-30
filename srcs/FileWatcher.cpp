#include "../includes/FileWatcher.hpp"

FileWatcher::FileWatcher(std::string srcsPath, std::string inclPath, std::chrono::duration<int, std::milli> delay) : incl_path{inclPath}, srcs_path{srcsPath}, delay{delay} {
    for(auto &file : std::filesystem::recursive_directory_iterator(srcs_path)) {
        srcs_paths_[file.path().string()] = std::filesystem::last_write_time(file);
    }

    for(auto &file : std::filesystem::recursive_directory_iterator(incl_path)) {
        incl_paths_[file.path().string()] = std::filesystem::last_write_time(file);
    }
}

void        FileWatcher::start(const std::function<void (std::string, FileStatus)> &action) {
    while(running_) {
        // Wait for "delay" milliseconds
        std::this_thread::sleep_for(delay);
        std::string file_path = incl_path;
        std::unordered_map<std::string, std::filesystem::file_time_type> paths_;

        paths_ = incl_paths_;
        auto it = paths_.begin();
        for (int i = 0; i < 2; i++) {
            while (it != paths_.end()) {
                if (!std::filesystem::exists(it->first)) {
                    action(it->first, FileStatus::erased);
                    it = paths_.erase(it);
                }
                else {
                    it++;
                }
            }
            // Check if a file was created or modified
            for(auto &file : std::filesystem::recursive_directory_iterator(file_path)) {
                auto current_file_last_write_time = std::filesystem::last_write_time(file);

                // File creation
                if(!contains(file.path().string(), paths_)) {
                    paths_[file.path().string()] = current_file_last_write_time;
                    action(file.path().string(), FileStatus::created);
                // File modification
                } else {
                    if(paths_[file.path().string()] != current_file_last_write_time) {
                        paths_[file.path().string()] = current_file_last_write_time;
                        action(file.path().string(), FileStatus::modified);
                    }
                }
            }
            paths_ = srcs_paths_;
            file_path = srcs_path;
        }

    }
}

bool        FileWatcher::contains(const std::string &key,
            std::unordered_map<std::string, std::filesystem::file_time_type> paths_) {
        auto el = paths_.find(key);
        return el != paths_.end();
}
