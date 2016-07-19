#!/bin/bash

# utility function
bldred='\033[1;31m'
bldgrn='\033[1;32m'
bldblu='\033[1;34m'
bldylw='\033[1;33m'
txtrst='\033[0m'

info () {
  printf "%b\n" "\n${bldblu}[ Exercice n° $1 ]${txtrst} $2"
}

task () {
  printf "%b\n" "${bldylw}[ Task n° $1 ]${txtrst} $2"
}

prt="${bldgrn}$>${txtrst}"

info "1" ": Installer mongoDB et démarrer le serveur"
echo -e "${prt} Go to https://docs.mongodb.com/manual/installation/ and follow instructions for download"

info "2" ": Se connecter sur le serveur est exécuter les commandes suivantes :
  - Afficher l’aide
  - Afficher les bases de données existante.
"
echo -e "${prt} db.help()"
echo -e "${prt} show databases"

info "3" ": Redémarrer le serveur en changeant les paramètres suivants :
  - Mettre le port d’écoute à 37017
  - Définir le dossier de stockage de la base dans un autre répertoire que celui par défaut (au choix)
  - Définir un chemin de fichier pour le stockage des logs
  - Changer le timestamp des logs en « ctime »"

echo -e "${prt} mongodb --config <CONFIG_FILE_PATH>.conf"
echo -e "${prt} Avec un fichier config contenant le contenu suivantes : \n$(cat ./mongodb-level1-practice-1.conf)"


