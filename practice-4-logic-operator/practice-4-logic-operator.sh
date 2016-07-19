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

info "1" ": Définir les propriétés d’opérateur logique"
echo -e "${prt} les opérateurs logiques sont \$or et \$and"

info "2" ": Afficher uniquement les films qui sont du genre « Horreur » ou « Suspense » ou « Thriller »"
echo -e "${prt} db.movies.find({  \$or: [{genre: 'Horreur'}, {genre: 'Suspense'}, {genre: 'Thriller'}] }).pretty()"

info "3" ": Afficher uniquement les films qui ont au moins un acteur qui est né en 1953 et un autre en 1955"
echo -e "${prt} db.movies.find({  \$and: [{'actors.birth_date': '1953'}, {'actors.birth_date': '1955'}] }).pretty()"

info "4" " : Afficher uniquement les films qui sont du genre « Horreur » ou « Suspense » ou « Thriller » qui sont de 1959 ou 1990"
echo -e "${prt} db.movies.find({  \$and: [{ \$or: [{genre: 'Horreur'}, {genre: 'Suspense'}, {genre: 'Thriller'} ]}, { \$or: [{year: 1959}, {year: 1990}] }] }).pretty()"