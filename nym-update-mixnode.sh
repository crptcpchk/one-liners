#!/bin/bash

exists() {
  command -v "$1" >/dev/null 2>&1
}
if exists curl; then
  echo ''
else
  sudo apt update && sudo apt install curl -y < "/dev/null"
fi

sleep 1

if exists git; then
  echo ''
else
  sudo apt update && sudo apt install git -y < "/dev/null"
fi

bash_profile=$HOME/.bash_profile
if [ -f "$bash_profile" ]; then
    . $HOME/.bash_profile
fi

sleep 1 && curl -s https://github.com/crptcpchk/utility-folder/blob/main/clogo.sh | bash && sleep 1

cd $HOME/nym

echo -e '\n\e[42mPullin latest branch\e[0m\n' && sleep 1
git pull
git switch -

echo -e '\n\e[42mBuilding latest binary\e[0m\n' && sleep 1
cargo build --release
cd target/release

echo -e '\n\e[42mRestarting daemon\e[0m\n' && sleep 1
systemctl daemon-reload
systemctl restart nym-node

echo -e '\n\e[42mBuild Info:\e[0m\n' && sleep 1
./nym-node build-info

echo -e '\n\e[42mChecking logs:\e[0m\n' && sleep 1
journalctl -u nym-node -f -o cat