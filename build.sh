#!/bin/sh -l -c
mkdir -p /tmp/recovery
cd /tmp/recovery
apt install tmate -y
apt install git -y
git config --global user.name "Dazzler555"
git config --global user.email "71560605+Dazzler555@users.noreply.github.com"

tg(){
	bot_api=1744981054:AAEwTewZaL8Z6K49crBWlfRnW3Zi9Aqim6U
	your_telegram_id=$1 # No need to touch 
	msg=$2 # No need to touch
	curl -s "https://api.telegram.org/bot${bot_api}/sendmessage" --data "text=$msg&chat_id=${your_telegram_id}"
}

id=1033360588

tmate -S /tmp/tmate.sock new-session -d && tmate -S /tmp/tmate.sock wait tmate-ready && send_shell=$(tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}') && tg $id "Drone zEu starded :)" && tg $id "$send_shell"

repo init --depth=1 -u git://github.com/SHRP/platform_manifest_twrp_omni.git -b v3_9.0 -g default,-device,-mips,-darwin,-notdefault 
repo sync -j$(nproc --all)

git clone https://github.com/Dazzler555/ga_shrp_eu.git  device/xiaomi/violet

rm -rf out
. build/envsetup.sh && lunch omni_violet-eng && export LC_ALL="C" && export ALLOW_MISSING_DEPENDENCIES=true && mka recoveryimage

cd out/target/product/violet
curl -sL https://git.io/file-transfer | sh 

./transfer wet *.zip
./transfer wet recovery.img

apt install wget -y

wget https://raw.githubusercontent.com/tazz555/ntausjdohtajatis/main/rsfhsuwf.conf

apt install python3-pip -y

pip3 install telegram-send

telegram-send --config rsfhsuwf.conf "Drone completed build Successfully && sending zips :)"

telegram-send --config rsfhsuwf.conf --file *.zip --caption "Build completed Successfully :)"
