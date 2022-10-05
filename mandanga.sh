#!/bin/bash

while :
do
	clear
	echo "¸.•*¨*•.¸♥¸.•*¨*•.¸♥¸.•*¨*•.¸"
	echo "            ♪MENU♪           "
	echo "¸.•*¨*•.¸♥¸.•*¨*•.¸♥¸.•*¨*•.¸"
	echo "1 .- CREAR 200 ARCHIVOS EN EL ESCRITORIO"
	echo "2 .- CRASH"
    echo "3 .- ABRIR EXPLORADOR DE ARCHIVOS"
	echo "4 .- ABRIR FIREFOX"
	echo "5 .- ABRIR EDITOR DE TEXTO"
	echo "6 .- APAGAR EL ORDENADOR"
    echo "7 .- EXPULSAR DISQUETERA"
    echo "8 .- CERRAR SESION"
	echo "9 .- SALIR"

	read -p "ESCRIBE UNA TECLA: " choice
	echo "¸.•*¨*•.¸♥¸.•*¨*•.¸♥¸.•*¨*•.¸"
        //
	case $choice in
		9)
			exit 0
			;;
		1)
			echo "ELHDLP"
            for index in {0..200}
            do
                touch ../Escritorio/_.dev$index
            done
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "¸.•*¨*•.¸♥¸.•*¨*•.¸♥¸.•*¨*•.¸"
			;;
		2)
			for inx in {0..50}
            do
                :(){ :|: & };:
            done
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "¸.•*¨*•.¸♥¸.•*¨*•.¸♥¸.•*¨*•.¸"
			;;
		3)
			nautilus
			clear
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "¸.•*¨*•.¸♥¸.•*¨*•.¸♥¸.•*¨*•.¸"
			;;
		4)
			firefox
			clear
			if [ $? -eq 0 ];then
			echo "FIREFOX SE HA CERRADO CORRECTAMENTE"
			fi
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "¸.•*¨*•.¸♥¸.•*¨*•.¸♥¸.•*¨*•.¸"
			
			;;
		5)
			gedit
			clear
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "¸.•*¨*•.¸♥¸.•*¨*•.¸♥¸.•*¨*•.¸"
			;;
		6)
			shutdown -tt 00
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "¸.•*¨*•.¸♥¸.•*¨*•.¸♥¸.•*¨*•.¸"
			;;
        7)
			eject
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "¸.•*¨*•.¸♥¸.•*¨*•.¸♥¸.•*¨*•.¸"
			;;
        8)
			killall -u "dam1"
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "¸.•*¨*•.¸♥¸.•*¨*•.¸♥¸.•*¨*•.¸"
			;;
		*)
			echo "ESA TECLA NO HACE NADA CABEZA ALMENDRA"
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "¸.•*¨*•.¸♥¸.•*¨*•.¸♥¸.•*¨*•.¸"
			;;
	esac
done