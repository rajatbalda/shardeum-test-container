# shardeum-test-container

This project aims to make the process of smoke testing Shardeum validators easier by providing a container that includes all the projects needed and scripts that automate the testing process.

## Install

First ensure that `docker` and `docker-compose` are installed and configured on your machine.

Next, clone this repository, `cd` into it, create an empty `.env` file and a `.secrets` file containing your git credentials:
```
GITUSER=<your_git_username>
GITPASS=<your_git_password>
```

Finally, run `./build.sh && ./up.sh && ./logs.sh` to build and start the container.

## Usage

Enter the `shardeum-test-container` with `./shell.sh`

Inside the container, run `./smoke-test.sh` to begin smoke testing.

## TODO

* Add the ability to set which branches are cloned for each project in the `.env` file.
* Allow mounting local copies of the git projects into the container as volumes in the `docker-compose.yml` file.
