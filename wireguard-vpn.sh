#!/bin/bash
 
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

echo -e '\n\e[44mUpdating the local package repository databasee\e[0m\n' && sleep 1
sudo apt-get update && sudo apt-get upgrade && sudo apt install curl -y < "/dev/null"

bash_profile=$HOME/.bash_profile
if [ -f "$bash_profile" ]; then
    . $HOME/.bash_profile
fi

echo -e '\n\e[44mInstalling curl\e[0m\n' && sleep 1
sudo apt install curl -y

echo -e '\n\e[44mCreating a folder\e[0m\n' && sleep 1
mkdir wireguard && cd wireguard && sleep 1

echo -e '\n\e[44mDownloading WireGuard manager & granting execution permissions\e[0m\n' && sleep 1
curl https://raw.githubusercontent.com/complexorganizations/wireguard-manager/refs/heads/main/wireguard-manager.sh --create-dirs -o $HOME/wireguard/wireguard-manager.sh
chmod +x wireguard-manager.sh

echo -e '\n\e[44mExecuting installation\e[0m\n' && sleep 1
echo -e '\e[32mYou need to fill some data for your VPN channel\e[39m' && sleep 1
bash ./wireguard-manager.sh
