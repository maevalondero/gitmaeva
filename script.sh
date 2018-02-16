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


#Nettoyer l'indentation
function affichage
{
        var=$(git branch | tr '*' ' ')

        for branch in $var
                do
                        echo "Dernier commit et message de la branche : $branch
"
                        # Changement de branche
                        git checkout "$branch" &> /dev/null
                        # Affichage des informations
                        git log --oneline -1 --pretty=format:"%s
%H

"
        done
}
#Il doit sexecuter si meme si c'est un dossier git
#Rajouter des couleurs
folders=$(ls -d1 */)

for folder in $folders
do
        cd $folder
        echo "Dépot : $folder
        "

        if [ -d ".git" ]
        then
                affichage
        else
                echo " Ceci n'est pas un dépot git"
        fi

        cd ..
done

echo " 

Tous les dépots git ont été analysés"

# - lister les dossiers qui se trouve là où le script se trouve 

#var2=$(ls | tr '$var' ' ')
#condition qui dispose le ls en liste

#deplacement()
#{
#		for liste in $var2
#				do
#						echo " $liste"
#						cd $liste
#						affichage $var
#						cd ..
#		done
#}
# var2 = variable de la liste de dossier





#if [ -d ".git" ]
#then
#var=$(git branch | tr '*' ' ')
#        echo "Voici la liste des branches"
#git branch
#        echo "-------------------------"
#	for liste in $var2
#		do
#			echo " $liste"
#			cd $liste
#			affichage $var
#			cd ..
#	done
#affichage $var
#else
#        echo "Le script ne se trouve pas dans un depot git"
#
#fi
#echo "Tous les fichiers ont été analysés"
