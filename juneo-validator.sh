#!/bin/bash

sleep 1 
echo -e '\e[40m\e[97m'
echo -e '                                                            '
echo -e '                                           /ψψ              '
echo -e '                                          | ψψ              '
echo -e '            /ψψψψψψψ /ψ/ψψψψψψ  /ψψψψψψ   | ψψ              '
echo -e '           /ψψ_____/| ψψ___ ψψ /ψψ__  ψψ  | ψψ              '
echo -e '          | ψψ      | ψψ   |_/| ψψ  \ ψψ|ψψψψψψψψ           '
echo -e '          | ψψ      | ψψ      | ψψ  | ψψ  | ψψ_/            '
echo -e '          | ψψψψψψψψ| ψψ      |  ψψψψψ /  | ψψψψψψ          '
echo -e '           \_______/|__/      | ψψ____/   |______/          '
echo -e '                              | ψψ  /ψψ       /ψψ           '
echo -e '                              |__/ | ψψ      | ψψ           '
echo -e '       /ψψψψψψψ  /ψψψψψψ   /ψψψψψψψ| ψψ      | ψψ   /ψψ     '
echo -e '      /ψψ_____/ /ψψ__  ψψ /ψψ_____/| ψψψψψψψ | ψψ /ψψ       '
echo -e '     | ψψ      | ψψ  \ ψψ| ψψ      | ψψ__  ψψ| ψψψψ         '
echo -e '     | ψψ      | ψψ  | ψψ| ψψ      | ψψ  \ ψψ| ψψ\ ψψ       '
echo -e '     | ψψψψψψψψ|  ψψψψψ /| ψψψψψψψψ| ψψ  | ψψ| ψψ \  ψψ     '
echo -e '      \_______/| ψψ____/  \_______/|__/  |__/|__/  \__/     '
echo -e '               | ψψ                                         '
echo -e '               |__/                                         '
echo -e '                                                            '
echo -e '\e[40m\e[93m         psi.crypto: https://discord.gg/Et92Ncafsk'
echo -e '\e[40m\e[92m          HackenDAO: https://x.com/HackenDAO     '
echo -e '\e[40m\e[97m             RawBox: https://x.com/rawbox_tech   '
echo -e '\e[40m\e[96m             zkSync: https://t.co/thgiIXqtlA     '
echo -e '\e[0m'

sleep 10

echo -e '\n\e[104mUpdating the local package repository databasee\e[0m\n' && sleep 1
sudo apt-get update && sudo apt-get upgrade && sudo apt install curl -y < "/dev/null"

bash_profile=$HOME/.bash_profile
if [ -f "$bash_profile" ]; then
    . $HOME/.bash_profile
fi

echo -e '\n\e[104mInstallin Docker & Docker Compose\e[0m\n' && sleep 1
sudo apt install git docker.io docker-compose -y

echo -e '\n\e[104mCloning GitHub repository\e[0m\n' && sleep 1
cd && git clone https://github.com/Juneo-io/juneogo-binaries && sleep 1

echo -e '\n\e[104mGranting execution permissions of the binary files\e[0m\n' && sleep 1
chmod +x ~/juneogo-binaries/juneogo
chmod +x ~/juneogo-binaries/plugins/jevm
chmod +x ~/juneogo-binaries/plugins/srEr2XGGtowDVNQ6YgXcdUb16FGknssLTGUFYg7iMqESJ4h8e

echo -e '\n\e[104mMoving jevm and srEr2XGGtowDVNQ6YgXcdUb16FGknssLTGUFYg7iMqESJ4h8e to .juneogo/plugins folder\e[0m\n' && sleep 1
mkdir -p ~/.juneogo/plugins && \
mv ~/juneogo-binaries/plugins/jevm ~/.juneogo/plugins && \
mv ~/juneogo-binaries/plugins/srEr2XGGtowDVNQ6YgXcdUb16FGknssLTGUFYg7iMqESJ4h8e ~/.juneogo/plugins

echo -e '\n\e[104mCreating a service file\e[0m\n' && sleep 1

echo "[Unit]
Description=JUNEO Node
After=network.target

[Service]
User=$USER
Type=simple
ExecStart=/root/juneogo-binaries/juneogo
Restart=on-failure
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target" > $HOME/juneod.service
sudo mv $HOME/juneod.service /etc/systemd/system

echo -e '\n\e[104mRunning a service\e[0m\n' && sleep 1
sudo systemctl daemon-reload
sudo systemctl enable juneod
sudo systemctl start juneod

echo -e '\n\e[104mCheck node status\e[0m\n' && sleep 1
if [[ `service juneod status | grep active` =~ "running" ]]; then
  echo -e "Your Juneo node \e[32minstalled and works\e[39m!"
  echo -e "You can check node status by the command \e[7mservice juneod status\e[0m"
  echo -e "Press \e[7mQ\e[0m for exit from status menu"
else
  echo -e "Your Juneo node \e[31mwas not installed correctly\e[39m, please reinstall."
fi
