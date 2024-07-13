#!/bin/bash

sudo apt-get update && sudo apt-get upgrade && sudo apt install curl -y < "/dev/null"

bash_profile=$HOME/.bash_profile
if [ -f "$bash_profile" ]; then
    . $HOME/.bash_profile
fi
sleep 1 
echo -e '\e[40m\e[92m'
echo -e '                                                            '
echo -e ' /ψψ   /ψψ                     /ψψ                          '
echo -e '| ψψ  | ψψ                    | ψψ                          '
echo -e '| ψψ  | ψψ  /ψψψψψ/ψ  /ψψψψψψψ| ψψ   /ψψ  /ψψψψψψ  /ψ/ψψψψψ '
echo -e '| ψψψψψψψψ /ψψ__  ψψ /ψψ_____/| ψψ /ψψ   /ψψ__  ψψ| ψψ__  ψψ'
echo -e '| ψψ__  ψψ| ψψ  \ ψψ| ψψ      | ψψψψ    | ψψψψψψψψ| ψψ  \ ψψ'
echo -e '| ψψ  | ψψ| ψψ  | ψψ| ψψ      | ψψ\ ψψ  | ψψ_____/| ψψ  | ψψ'
echo -e '| ψψ  | ψψ|  ψψψψψ ψ| ψψψψψψψψ| ψψ \  ψψ|  ψψψψψψψ| ψψ  | ψψ'
echo -e '|__/  |__/ \______/  \_______/|__/  \__/ \_______/|__/  |__/'
echo -e '                                                            '
echo -e '                /ψψψψψψ                                     '
echo -e '               | ψψ___/ψψ                                   '
echo -e '               | ψψ   |ψψ  /ψψψψψ/ψ  /ψψψψψψ                '
echo -e '               | ψψ   |ψψ /ψψ__  ψψ /ψψ____ψψ               '
echo -e '               | ψψ   |ψψ| ψψ  \ ψψ| ψψ   |ψψ               '
echo -e '               | ψψ   |ψψ| ψψ  | ψψ| ψψ   |ψψ               '
echo -e '               | ψψψψψψ /|  ψψψψψ ψ|  ψψψψψψ/               '
echo -e '                \_____/   \______/ \_______/                '
echo -e '                                                            '
echo -e '                       and @crptcpchk                       '
echo -e '\e[0m'

sleep 4

echo -e '\n\e[42mInstallin Docker & Docker Compose\e[0m\n' && sleep 1
sudo apt install git docker.io docker-compose -y

echo -e '\n\e[42mCloning GitHub repository\e[0m\n' && sleep 1
cd && git clone https://github.com/Juneo-io/juneogo-binaries && sleep 1

echo -e '\n\e[42mGranting execution permissions of the binary files\e[0m\n' && sleep 1
chmod +x ~/juneogo-binaries/juneogo
chmod +x ~/juneogo-binaries/plugins/jevm
chmod +x ~/juneogo-binaries/plugins/srEr2XGGtowDVNQ6YgXcdUb16FGknssLTGUFYg7iMqESJ4h8e

echo -e '\n\e[42mMoving jevm and srEr2XGGtowDVNQ6YgXcdUb16FGknssLTGUFYg7iMqESJ4h8e to .juneogo/plugins folder\e[0m\n' && sleep 1
mkdir -p ~/.juneogo/plugins && \
mv ~/juneogo-binaries/plugins/jevm ~/.juneogo/plugins && \
mv ~/juneogo-binaries/plugins/srEr2XGGtowDVNQ6YgXcdUb16FGknssLTGUFYg7iMqESJ4h8e ~/.juneogo/plugins

echo -e '\n\e[42mCreating a service file\e[0m\n' && sleep 1

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

echo -e '\n\e[42mRunning a service\e[0m\n' && sleep 1
sudo systemctl daemon-reload
sudo systemctl enable juneod
sudo systemctl start juneod

echo -e '\n\e[42mCheck node status\e[0m\n' && sleep 1
if [[ `service juneod status | grep active` =~ "running" ]]; then
  echo -e "Your Juneo node \e[32minstalled and works\e[39m!"
  echo -e "You can check node status by the command \e[7mservice juneod status\e[0m"
  echo -e "Press \e[7mQ\e[0m for exit from status menu"
else
  echo -e "Your Juneo node \e[31mwas not installed correctly\e[39m, please reinstall."
fi
