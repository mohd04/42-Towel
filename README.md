# 42-Towel

## Idea Description
An Automation script for 42 students to automate the students development process when working on 42 C/C++ project.

## Instructions
Clone the repository.

```bash
git clone git@github.com:mohd04/42-Towel.git
```

### Dev Mode
dev mode is a tool that helps 42 Students develop 42 based projects by automatically restarting the project when file changes in directory (source and includes) are detected.

It does not require any additional changes to your code or method of development. To use dev mode, run the following commad:

```bash
towel dev
```

### 42-Devcontainer
This command would help you install 42 Devcontainer developed by Dale
To install, run the following commad:

```bash
towel dev-container
```
![alt text](https://github.com/mohd04/42-Towel/blob/dev/pic/continer.png?raw=true)

### Testers Installer
Installs the testers for the chosen project. Simply run in the command line the following command to choose which testers to clone and directly run: 

```bash
towel testers
```
![alt text](https://github.com/mohd04/42-Towel/blob/dev/pic/tester1.png?raw=true)
![alt text](https://github.com/mohd04/42-Towel/blob/dev/pic/tester2.png?raw=true)
![alt text](https://github.com/mohd04/42-Towel/blob/dev/pic/tester3.png?raw=true)

### Synced-Push
To connect the Vogsphere with GitHub and enable simultaneous pushing to both, simply run in the command line:

```bash
towel synced-push
```
 
### 42-Header
To add the 42 Header, simply run in the command line: 

```bash
towel header
```

### C-clean
To install C-clean and add it to alias: 

```bash
towel c_clean
```

### C++ Template Generator
To generate C++ templates run in the command line: 

```bash
towel cpp
```

### gitignore
Enables us to hide the unwanted files through the terminal. Simply use the command:

```bash
towel gitignore
```

### Norm
To check for the norm, simply run in the command line: 

```bash
towel norm
```
By doing so, norminette will be executed. In case there are no norm errors `Norminette: Success` will be printed. However, if the norm was not ... the individual norm errors will be printed.

### Brew
To install brew on the 42 iMacs in the labs run: 

```bash
towel brew
```

## Team Members
Mohammed Patel, Bassam Naji, Abubaker Alseri, Youssef El Toukhi 

Mentor - Khalifa Almheiri
### Resources
https://github.com/ombhd/Cleaner_42.git

https://github.com/lorenuars19/CPP-Project-Template.git

https://github.com/omimouni/42homebrew

https://github.com/42Paris/42header

https://github.com/opsec-infosec/42-Devcontainer
