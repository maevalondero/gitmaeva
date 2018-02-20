#!/bin/bash  

# Il me semble bien (j'en suis même certain) que je t'avais dit ça en détail mais je te le remet ici:
# Le script doit faire les choses dans le bon ordre, c'est à dire
# - lister les dossiers qui se trouve là où le script se trouve ok
# - Prendre cette liste (une variabe) ok
# - Dans une boucle: 
#     - Entrer dans un dossier (un à la fois, ça passera par tous les dossiers via la boucle)
#     - Vérifier si c'est un dépot git (ce que tu fais à la ligne 35)
#     - Si c'est un dépot git lancer la fonction qui liste le dernier commit
#     - Si c'est pas un dépot git soit dire que c'en est pas un
#     - Sortir du dossier (cd ..)
#     - la boucle passe au dossier suivant
# - En fin de script mettre un truc qui dit que tous les dépots git ont été "analysés"

# LISTE DE COULEURS DEJA CRÉES PAR DES UTILISATEURS

#Nettoyer l'indentation
function affichage
{
        var=$(git branch | tr '*' ' ')

        for branch in $var
                do
                        echo -e "\033[35mDernier commit et message de la branche : $branch\033[0m
"
                        # Changement de branche
                        git checkout "$branch" &> /dev/null
                        # Affichage des informations
                        git log --oneline -1 --pretty=format:"%s
%H

"
        done
}

if [  -d ".git" ]
then
        affichage
else

folders=$(ls -d1 */)

for folder in $folders
do
        cd $folder
        echo -e "\033[33mDépot : \033[00m $folder
        "

        if [ -d ".git" ]
        then
                affichage
        else
                echo " Ceci n'est pas un dépot git"
        fi

        cd ..
done

echo -e " 

\033[32mTous les dépots git on été analysés\033[00m"
fi

