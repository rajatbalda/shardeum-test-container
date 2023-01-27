#!/usr/bin/env bash

# Install rust
curl https://sh.rustup.rs -sSf | bash -s -- -y
source $HOME/.cargo/env

# Install Node.js via nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
source $HOME/.nvm/nvm.sh
source $HOME/.profile
source $HOME/.bashrc
nvm install 16.11.1
npm config set python python3

# Clone and install all git projects needed for shardeum smoke/load testing
source /run/secrets/git-creds
git config --global credential.helper "!f() { sleep 1; echo \"username=${GITUSER}\"; echo \"password=${GITPASS}\"; }; f"
(git clone -b dev https://gitlab.com/shardeum/server.git && cd server && npm i) &
(git clone -b dev https://gitlab.com/shardeum/json-rpc-server.git && cd json-rpc-server && npm i) &
(git clone -b dev https://gitlab.com/shardeum/explorer-server-v2.git && cd explorer-server-v2 && npm i) &
(git clone -b dev https://gitlab.com/shardeum/load-tester.git && cd load-tester && npm i) &
wait
git config --global credential.helper cache
unset GITUSER
unset GITPASS

# Install the shardus-cli tool globally with npm
npm i -g shardus

# Keep container running
echo
echo "Done. Run ./docker-shell.sh to enter container.";
tail -f /dev/null
