#!/bin/bash

# Author: h3g0c1v
# Script en BASH para saber que scripts de nmap hay para un protocolo determinado

# Colores
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

function helpPanel() {
  echo -en "\n${green}[i]${end}${gray} Uso:${end} "
  echo -en "${blue}$0 PROTOCOLO1 [PROTOCOLO2 PROTOCOLO3 ...]"
  exit 1
}

if [[ $# -lt 1 ]]; then
  echo -e "\n${red}[!] Introduce uno o mas protocolos${end}"
  helpPanel
fi

protocolos=$@

for protocolo in $protocolos; do
  comando=$(locate .nse | sed "s/\/usr\/share\/nmap\/scripts\//\t/g" | grep -Ei ".*$protocolo-.*")
  mostrar_protocolo=$(echo $protocolo | tr '[:lower:]' '[:upper:]')

  if [[ $comando ]]; then
    echo -e "\n${green}[+]${end}${yellow} $mostrar_protocolo${end}"
    echo -e "${blue}$comando${end}"
  else
    echo -e "\n${red}[$mostrar_protocolo]: No se encontro ningun script"
  fi
done
