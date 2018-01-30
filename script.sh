#!/bin/bash


echo "------------------------------"
var=$(git branch | tr '*' ' ')
if [ -d "*.git"]
then
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
        git checkout "$branch" 2>/dev/null
        # Affichage des informations
        git log --oneline -1 --pretty=format:"                  %s
                %H"
        git checkout master
done
fi
