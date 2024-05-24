#!/bin/bash

progname="optiname"
cd "$(dirname $0)"

usage() {
cat <<EOU

Installiert/Deinstalliert ${progname} 
Zielverzeichnis ist ein lokales PATH-Verzeichnis.
Ohne Angabe einer Option wird das Programm installiert.

Syntax: $progname [-h] [-u]

Optionen:

   -h

	ruft diese Hilfe auf

   -u

	Deinstalliert $progname

EOU
}

while getopts hu opt
do
   case $opt in
       h) usage
          exit
       ;;
       u) # uninstall
          find ~/.local/bin ~/bin -iname "$progname" -exec rm -vi {} \;
          exit
       ;;
   esac
done

OLDIFS="$IFS"
IFS=':'
for dir in $PATH; do
 if [ "$dir" == "${HOME}/.local/bin" ]; then
  installdir="${HOME}/.local/bin"
  break
 elif [ "$dir" == "${HOME}/bin" ]; then
  installdir="${HOME}/bin"
  break
 fi
done
IFS="$OLDIFS"

echo "Dieses Skript installiert ${progname} in: ${installdir}"
read -p "Weiter mit [ENTER]. Abbruch mit [STRG]+[C]"

while true
  do
   read -p "Soll eine [s]ymbolische Verknüpfung auf ${progname} angelegt werden oder [k]opiert werden? " symcopy
    case "$symcopy" in
      s|S) ln -vis "${PWD}/optiname" "${installdir}/${progname}"
          break
          ;;
      k|K) cp -vi "${PWD}/optiname" "${installdir}/"
          break
          ;;
      *) echo "Fehlerhafte Eingabe!"
          ;;
    esac
done
