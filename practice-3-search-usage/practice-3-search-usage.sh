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

info "1" ": Définir ce qu’est une projection"
echo -e "${prt} On appelle projection la prossibilité de limiter les champs remontés pour chaque résultat. Par défaut, une requête find() renvoie les résultats sous forme de documents pourvus de l'intégralité de leurs champs."

info "2" ": Afficher uniquement le « titre » et « l'année » des films du genre « Action »"
echo -e "${prt} db.movies.find({genre: 'Action'}, {title: 1, year: 1})"

info "3" ": Afficher tous les champs des films du genre « Action » sauf « director » et «  actors »"
echo -e "${prt} db.movies.find({genre: 'Action'}, {director: 0, actors: 0}).pretty()"

info "4" ": Afficher uniquement le « titre », « l'année », « le pays » des films du genre « Action » et omettre le paramètre « _id »"
echo -e "${prt} db.movies.find({genre: 'Action'}, {title: 1, year: 1, country:1, _id: 0})"

info "5" ": Identifier les fonctions d'intervalle pour la recherche"
echo -e "${prt} [ \$gt ] pour la partie supérieure stricte, et [ \$gte ] pour inclure la borne."
echo -e "${prt} [ \$lt ] pour la partie inférieure stricte, et [ \$lte ] pour inclure la borne."

info "6" ": Afficher les films strictement sortis après 2004."
echo -e "${prt} db.movies.find({ year: { \$gt : 2004 } }).pretty()"

info "7" ": Afficher les films strictement sortis avant 1960."
echo -e "${prt} db.movies.find({ year: { \$lt: 1960} }).pretty()"

info "8" ": Afficher les films sortis entre 1980 et 1982"
echo -e "${prt} db.movies.find({ year: { \$gte: 1980, \$lte: 1982} }).pretty()"

info "9" ": Afficher le nombre de film en base sortis entre 1980 et 1982"
echo -e "${prt} db.movies.find({ year: { \$gte: 1980, \$lte: 1982} }).count()"

info "10" ": Afficher par ordre alphabétique les films en base sortis entre 1980 et 1995, et limiter le résultat à 5"
echo -e "${prt} db.movies.find({ year: { \$gte: 1980, \$lte: 1995} }).sort({ title : 1 }).limit(5)"

