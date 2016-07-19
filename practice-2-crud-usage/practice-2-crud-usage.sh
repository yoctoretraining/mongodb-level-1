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

info "1" ": Importer les données fournies dans mongodb"
echo -e "${prt} mongorestore <DOSSIER EXPORTER>"

info "2" ": Effectuer une insertion en suivant les étapes ci-dessous : "
task "2.1" ": Identifier la commande permettant d’effectuer une insertion"
echo -e "${prt} db.collection.insert()"

task "2.3" ": Insérer dans la collection « movies » un nouveau film avec les informations suivantes : 
 - id : « movie:66 »
 - title : « MongoDB c'est génial »
 - year : 2016
 - genre : « Classic »"
echo -e "${prt} db.movies.insert({ \"_id\" : \"movie:66\", \"title\" : \"MongoDB c'est génial\" , \"year\" : 2016, \"genre\" : \"Classic\" })"

info "3" ": Effectuer une recherche simple"
task "3.1" ": Identifier la commande permettant de faire une recherche globale"
echo -e "${prt} db.collection.find()"

task "3.2" ": Identifier la commande permettant de faire une recherche du premier élément"
echo -e "${prt} db.collection.findOne()"

task "3.3" ": Rechercher tous les films dans la base de données"
echo -e "${prt} db.collection.find()"

task "3.3" ": Rechercher tous les films dans la base de données ayant pour année « 1995 »"
echo -e "${prt} db.collection.find({ year : 1995 })"

task "3.4" ": Rechercher le premier film dans la base de données"
echo -e "${prt} db.collection.findOne()"

task "3.5" ": Rechercher le premier film dans la base de données ayant pour pays « USA »"
echo -e "${prt} db.collection.findOne({ country : \"USA\" })"

task "3.6" ": Rechercher le film ayant l'id « movie:66 »"
echo -e "${prt} db.collection.find({ _id : \"movie:66\" })"

info "4" ": Effectuer des actions de mises à jour en suivants les étapes ci-dessous :"
task "4.1" ": Identifier la commande qui permet de faire un update"
echo -e "${prt} db.collection.update()"

task "4.2" ": Insérer une personne dans la collection \"people\" avec les informations suivantes : 
 - name : « Smith »
 - firstname : « John »
 - age : 30"
echo -e "${prt} db.people.insert( { name: \"Smith\", firstname: \"John\", age: 30 } )"

task "4.3" ": Afficher les tous les personnes" 
echo -e "${prt} db.people.find()"

task "4.4" ": Afficher les tous les personnes" 
echo -e "${prt} db.people.find()"

task "4.5" ": Remplacer complètement le document existant avec les éléments suivants : 
 - name : « Tim »
 - salary : 1000"
echo -e "${prt} db.people.update( { name: \"Smith\" }, { name: \"Tim\", salary: 1000 } )"

task "4.6" "Modifier les champs d’un document avec les éléments suivants :
 - Mettre l’âge à 50 pour les personnes s’appelant « Tim »"
echo -e "${prt} db.people.update( { name: \"Tim\" }, { \$set: { age: 50 } } )"

task "4.7" "Réinsérer une personne s’appelant « Smith John » et ayant 30 ans"
echo -e "${prt} db.people.insert( { name: \"Smith\", firstname: \"John\", age: 30 } )"

task "4.8" "Modifier les champs de plusieurs document avec la règle suivante :
 - Mettre l’âge des personnes ayant plus de 20 ans à 10."
echo -e "${prt} db.people.update( { age: { \$gt: 20 } }, { \$set: { age: 10 } }, { multi: 1 } )"

task "4.9" "Effectuer une mise à jour pour une personne dont le nom est « Jenkins » et l’âge « 33 » et le créer s’il n’existe pas"
echo -e "${prt} db.people.update( { name: \"Jenkins\" }, { \$set: { age: 33 } }, { upsert: 1 } )"

task "4.10" "Supprimer le champ « age » pour la personne s’appelant « Smith »"
echo -e "${prt} db.people.update( { name: \"Smith\" }, { \$unset: { age: 1 } } )"

task "4.11" "Augmenter l’âge de la personne s’appelant « Smith » d’une année"
echo -e "${prt} db.people.update( { name: \"Smith\" }, { \$inc: { age: 1 } } )"

info "5" ": Effectuer des actions de mise à jour sur des tableaux en suivants les étapes ci-dessous :"
task "5.1" ": Insérer un tableau dans la collection « arrays » ayant les valeurs suivantes : 
 - id : 0
 - v : [ 1, 2, 3, 4, 5 ]"
echo -e "${prt} db.arrays.insert({ \"_id\" : 0, \"v\" : [1,2,3,4]})"

task "5.2" ": Afficher les valeurs insérées"
echo -e "${prt} db.arrays.findOne()"

task "5.3" ": Modifier le 3ème élément du tableau « v » avec la valeur 100 "
echo -e "${prt} db.arrays.update( { _id: 0 }, { \$set: { \"v.2\" : 99 } } )"

task "5.4" ": Ajouter la valeur « 6 »  à la fin du tableau « v »"
echo -e "${prt} db.arrays.update( { _id: 0 }, { \$push: { v : 6 } } )"

task "5.5" ": Ajouter les valeurs « 7, 8, 9 » à la fin du tableau « v »"
echo -e "${prt} db.arrays.update( { _id: 0 }, { \$pushAll: { a : [ 7, 8, 9 ] } } )"

task "5.6" ": Ajouter une valeur unique « 5 » dans le tableau « v »"
echo -e "${prt} db.arrays.update( { _id: 0 }, { \$addToSet: { v : 5 } } )"

info "6" ": Supprimer les éléments d’un tableau avec les règles suivantes :"
task "6.1" ": Supprimer la dernière valeur du tableau « v »"
echo -e "${prt} db.arrays.update( { _id: 0 }, { \$pop : { v : 1 } })"

task "6.2" ": Supprimer la première valeur du tableau « v »"
echo -e "${prt} db.arrays.update( { _id: 0 }, { \$pop : { v : -1 } })"

task "6.3" ": Supprimer la valeur « 6 » du tableau « v »"
echo -e "${prt} db.arrays.update( { _id: 0 }, { \$pull: { v : 6 } })"

task "6.4" ": Supprimer les valeurs « 4, 8, 9 » du tableau « v »"
echo -e "${prt} db.arrays.update( { _id: 0 }, { \$pullAll: { v : [ 4, 8, 9 ] } })"

info "7" ": Actions de suppression en suivant les règles suivantes :"
task "7.1" " : Supprimer le document ayant l’id « 0 » dans la collection « arrays »"
echo -e "${prt} db.arrays.remove({ _id : 0 })"

task "7.2" " : Supprimer la collection « arrays »"
echo -e "${prt} db.arrays.drop()"