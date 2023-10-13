#!/bin/bash

menu_principal() {
	echo "MENU PRINCIPAL"
	echo "1) A.B.M USUARIO"
	echo "2) A.B.M GRUPO"
	echo "3) Añadir un usuario a un grupo"
	echo "4) salir"
	
	read -p "Seleccione una opcion: " opcion

	case $opcion in
		1)
			usuario
			;;
		2)
			grupo
			;;

		3)	read -p "Escriba el nombre del usuario: " usuariomod
			if getent passwd "$usuariomod" >/dev/null; then
				read -p "Escriba el nombre del grupo al que quiere agregar al usuario: " grupomod
					if getent group "$grupomod" >/dev/null; then
							usermod -aG "$grupomod" "$usuariomod"
			else
							echo "El grupo no existe."
		fi
		else
			echo "El usuario no existe."
		fi
		;;	

		4)	exit
			;;
		*)
			echo "Opcion no valida."
			;;
		esac
}
usuario() {
	echo "A.B.M USUARIOS"
	echo "a) AGREGAR USUARIO"
	echo "b) BORRAR USUARIO"
	echo "c) MODIFICAR USUARIO"
	echo "d) VOLVER"

	read -p "Seleccione una opcion: " useropcion

	case $useropcion in
	a)
		read -p "Escriba el nombre para el usuario: " usuarionom
		if getent passwd "$usuarionom" >/dev/null; then
			echo "El usuario ya existe."
		else
			useradd "$usuarionom"
			echo "El usuario ha sido creado."
		fi
		;;
	b)
		read -p "Escriba el nombre del usuario que quiere borrar: " usuarionomb
		if getent passwd "$usuarionomb" >/dev/null; then
			userdel "$usuarionomb"
			echo "El usuario ha sido borrado."
		else
			echo "El usuario que intentas borrar no existe."
		fi
		;;
	c)
		read -p "Escriba el nombre del usuario que quiere modificar: " usuarionomc
		if getent passwd "$usuarionomc" >/dev/null; then
			read -p "Escriba el nombre nuevo de tu usuario: " usuarionomn
				usermod -l "$usuarionomn" "$usuarionomc"
		else
			echo "El usuario que intentas modificar no existe."
		fi
		;;
	d)
		menu_principal
		;;
	*)
		echo "no valido"
		;;
	esac
}

grupo() {
	echo "A.B.M GRUPOS"
	echo "a) AGREGAR GRUPO"
	echo "b) BORRAR GRUPO"
	echo "c) MODIFICAR GRUPO"
	echo "d) VOLVER"

	read -p "Seleccione una opcion: " grupoopcion

	case $grupoopcion in
	a)
		read -p "Escriba el nombre para el grupo: " gruponom
		if getent group "$gruponom" >/dev/null; then
			echo "El grupo ya existe."
		else
			groupadd "$gruponom"
			echo "El grupo ha sido creado."
		fi
		;;
	b)
		read -p "Escriba el nombre del grupo que quiere borrar: " gruponomb
		if getent group "$gruponomb" >/dev/null; then
			groupdel "$gruponomb"
			echo "El grupo ha sido borrado."
		else
			echo "El grupo que intentas borrar no existe."
		fi
		;;
	c)
		read -p "Escriba el nombre del grupo que quiere modificar: " gruponomc
		if getent group "$gruponomc" >/dev/null; then
			read -p "Escriba el nombre nuevo de tu grupo: " gruponomn
				groupmod -n "$gruponomn" "$gruponomc"
		else
			echo "El grupo que intentas modificar no existe."
		fi
		;;
		
	d)
		menu_principal
		;;
	*)
		echo "no valido"
		;;
	esac
}

menu_principal