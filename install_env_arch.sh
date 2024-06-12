#!/usr/bin/bash

# Colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Variables globales
user=$(whoami)

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n\n${redColour}[!] Saliendo...\n${endColour}"
	exit 1
}

function banner(){
	echo -e "\n${turquoiseColour}              _____            ______"
	sleep 0.05
	echo -e "______ ____  ___  /______      ___  /___________________      ________ ___"
	sleep 0.05
	echo -e "_  __ \`/  / / /  __/  __ \     __  __ \_  ___/__  __ \_ | /| / /_  __ \`__ \\"
	sleep 0.05
	echo -e "/ /_/ // /_/ // /_ / /_/ /     _  /_/ /(__  )__  /_/ /_ |/ |/ /_  / / / / /"
	sleep 0.05
	echo -e "\__,_/ \__,_/ \__/ \____/      /_.___//____/ _  .___/____/|__/ /_/ /_/ /_/    ${endColour}${yellowColour}(${endColour}${grayColour}Por ${endColour}${purpleColour}@zelaya420${endColour}${yellowColour})${endColour}${turquoiseColour}"
	sleep 0.05
    	echo -e "                                             /_/${endColour}"
}

banner
sleep 1
echo -e "\n\n${blueColour}[*] Instalando paquetes necesarios para el entorno...\n${endColour}"
sleep 2
sudo pacman -Syu --noconfirm kitty rofi feh xclip ranger betterlockscreen playerctl scrot scrub wmname firejail imagemagick cmatrix htop neofetch python-pip procps-ng tty-clock fzf lsd bat pamixer flameshot
if [ $? != 0 ] && [ $? != 130 ]; then
	echo -e "\n${redColour}[-] ¡Error al instalar algunos paquetes!\n${endColour}"
	exit 1
else
	echo -e "\n${greenColour}[+] Hecho\n${endColour}"
	sleep 1.5
fi

echo -e "\n${blueColour}[*] Instalando pywal...\n${endColour}"
sleep 2
sudo pip3 install pywal
if [ $? != 0 ] && [ $? != 130 ]; then
	echo -e "\n${redColour}[-] ¡Error al instalar pywal o la operación fue cancelada por el usuario!\n${endColour}"
	exit 1
else
	echo -e "\n${greenColour}[+] Hecho\n${endColour}"
	sleep 1.5
fi

echo -e "\n${blueColour}[*] Comenzando la instalación de las dependencias necesarias para el entorno...\n${endColour}"
sleep 0.5

echo -e "\n${purpleColour}[*] Instalando dependencias necesarias para bspwm...\n${endColour}"
sleep 2
sudo pacman -S --noconfirm bspwm sxhkd
if [ $? != 0 ] && [ $? != 130 ]; then
	echo -e "\n${redColour}[-] ¡Error al instalar bspwm y sxhkd!\n${endColour}"
	exit 1
else
	echo -e "\n${greenColour}[+] Hecho\n${endColour}"
	sleep 1.5
fi

echo -e "\n${purpleColour}[*] Instalando dependencias necesarias para polybar...\n${endColour}"
sleep 2
sudo pacman -S --noconfirm cmake cairo xcb-util xcb-util-wm xcb-util-image xcb-util-keysyms alsa-lib pulseaudio jsoncpp libmpdclient curl libnl
if [ $? != 0 ] && [ $? != 130 ]; then
	echo -e "\n${redColour}[-] ¡Error al instalar algunas dependencias para polybar!\n${endColour}"
	exit 1
else
	echo -e "\n${greenColour}[+] Hecho\n${endColour}"
	sleep 1.5
fi

echo -e "\n${purpleColour}[*] Instalando dependencias necesarias para picom...\n${endColour}"
sleep 2
sudo pacman -S --noconfirm meson xorg-server-devel xorg-xwininfo xorg-xdpyinfo uthash libev xcb-util-image xcb-util-renderutil pcre evdev
if [ $? != 0 ] && [ $? != 130 ]; then
	echo -e "\n${redColour}[-] ¡Error al instalar algunas dependencias para picom!\n${endColour}"
	exit 1
else
	echo -e "\n${greenColour}[+] Hecho\n${endColour}"
	sleep 1.5
fi

echo -e "\n${blueColour}[+] Paquetes instalados correctamente :D\n${endColour}"
