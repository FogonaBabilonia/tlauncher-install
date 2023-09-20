#!/usr/bin/env bash

download_tl() {
	curl https://dl2.tlauncher.org/f.php?f=files/TLauncher-2.885.zip -o "TLauncher.zip"
	unzip TLauncher.zip -x README-EN.txt README-RUS.txt
}

download_icon() {
	curl https://i.imgur.com/yN4ciBD.png -o yN4ciBD.png
}

create_entry() {
	echo "
[Desktop Entry]
Name=TLauncher
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=java -jar $HOME/.tl_minecraft/TLauncher-2.885.jar
Icon=$HOME/.tl_minecraft/yN4ciBD.png" > tlauncher.desktop
	cp tlauncher.desktop $HOME/.local/share/applications
}

set_files() {
	mkdir $HOME/.tl_minecraft
	cp TLauncher-2.885.jar $HOME/.tl_minecraft
	cp yN4ciBD.png $HOME/.tl_minecraft

	rm TLauncher.zip TLauncher-2.885.jar yN4ciBD.png tlauncher.desktop
}

if  ! [[ -x "$(command -v java -version)" ]]; then
	echo "you do not have java installed"
	exit 1
fi

download_tl
download_icon
create_entry
set_files
