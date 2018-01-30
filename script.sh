#!/bin/bash
#git branch
echo "-----------------"
#git log --all --max-count=3

#git log
#git log --branches --oneline --all -3 "s%"

echo "----------"

#git log test -1
#git log master -1
#git log dev -1

#
#lister les branches
#recuperer x branches
#les mettre dans x variables
#
#echo "Voici la liste des branches : "
#git branch
echo "------------------------------"
var=$(git branch | tr '*' ' ')

#var="test
#master
#dev
#"
echo "Voici la liste des branches"
git branch
echo "-------------------------"
# Boucle for qui dispose les branches en liste
for branch in $var
do
        echo "
        Dernier commit et message de la branche : $branch
        "
        # Changement de branche
        git checkout "$branch"
        # Affichage des informations
        git log --oneline -1 --pretty=format:"                  %s
                %H"
done
