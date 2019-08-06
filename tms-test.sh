#!/bin/bash
echo -e "\e[34mTestowanie konfiguracji TMS"
echo -e "\e[92mZielony -OK, \e[91mCzerwony - zle, \e[34mNiebieski - informacyjne\n"

# Testowanie obecnosci pliku licence.xml
if [ -e /home/rosettaserver/RosettaBridge/license/license.xml ] ; then
  echo -e "\e[92mMasz plik license.xml"
else
  echo -e "\e[91mNie masz pliku license.xml"
fi

# Testowanie obecnosci pliku properties
if [ -e /home/rosettaserver/RosettaBridge/tms-server.properties ] ; then
  echo -e "\e[92mMasz plik properties"
else
  echo -e "\e[91mNie masz pliku properties"
fi

# Testowanie obecnosci pliku baza danych
if [ -e /home/rosettaserver/RosettaBridge/db/Rosetta.h2.db ] ; then
  echo -e "\e[92mMasz plik bazy danych"
else
  echo -e "\e[91mNie masz pliku bazy danych"
fi


#Plik fstab
echo -e "\n\e[34mMontowanie biblioteki library"
lib=`cat /etc/fstab | grep library`
first_char="$(printf '%s' "$lib" | cut -c1)"
if [ "$first_char" = "#" ]; then
  echo -e "\e[91mZaczyna na sie od #"
else
  echo -e "\e[92mNie zaczyna sie od #"
fi
echo "$lib"

#Data i czas
echo -e "\n\e[34mObecna data i czas"
echo $(date '+%Y-%m-%d %H:%M:%S')
echo "Strefa czasowa"
strefa=`timedatectl|grep "Time zone"`
echo -e "$strefa\n"

#Serwery czasu
echo -e "\e[34mServery czasu:"
ntp=`cat /etc/ntp.conf |grep ^server`
echo -e "$ntp\n"

#Pingowanie strony google.pl - testowanie DNS
echo -e "\e[34mTestowanie sieci i dns"
ping=`ping -c1 www.google.pl|grep bytes`
echo -e "$ping\n"

#Adresy IP
echo -e "\e[34mAdresacja IP"
adresy=`ifconfig |grep "inet "`
echo -e "$adresy\n"
echo -e "\e[39mKoniec pracy."

