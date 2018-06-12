#!/bin/bash

# Makache Package...
#
# Script desenvolvido para auxiliar as tarefas básicas do
# apache como criação de sites, habilitação / desabilitação
# do website;

DEBUG=0
VERBOSE=0
source 'makache.conf'

s_SERVER_NAME=""
S_NAME=""

echo $APACHE_LOG_DIR

while test -n "$1"
do
	if  test  "$1" =="-name"
	then
		shift
		S_NAME=$1
		S_NAME="$S_NAME.conf"
	fi
	if test "$1" == "-d"
	then
		DEBUG=1
	fi
	if test "$1" -eq "--verbose"
	then
		VERBOSE=1
	fi
shift
done

if test "$S_NAME" == "1"
then
	echo '### Parametros e criação ###'
	echo "Informe o nome do projeto: [Este também será os nomes do diretórios de log, de arquivos e do arquivo conf] "
	read S_NAME
	echo 'Informe o ServerName: '
	read S_SERVER_NAME
fi

source 'makache.vhost.template'
echo $TEMPLATE

#SCRIPT_CREATE="touch $APACHE_SOURCE_DIR$S_NAME"
#echo "$SCRIPT_CREATE"

exit 0
