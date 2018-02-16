#!/bin/bash  -vx

# Il me semble bien (j'en suis même certain) que je t'avais dit ça en détail mais je te le remet ici:
# Le script doit faire les choses dans le bon ordre, c'est à dire
# - lister les dossiers qui se trouve là où le script se trouve
# - Prendre cette liste (une variabe)
# - Dans une boucle: 
#     - Entrer dans un dossier (un à la fois, ça passera par tous les dossiers via la boucle)
#     - Vérifier si c'est un dépot git (ce que tu fais à la ligne 35)
#     - Si c'est un dépot git lancer la fonction qui liste le dernier commit
#     - Si c'est pas un dépot git soit dire que c'en est pas un
#     - Sortir du dossier (cd ..)
#     - la boucle passe au dossier suivant
# - En fin de script mettre un truc qui dit que tous les dépots git ont été "analysés"




fonction1()
{
        for branch in $var
                do
                        echo "
                        Dernier commit et message de la branche : $branch
                        "
                        # Changement de branche
                        git checkout "$branch" &> /dev/null
                        # Affichage des informations
                        git log --oneline -1 --pretty=format:"                  %s
                                %H"
        done
}


echo "------------------------------"

var=$(git branch | tr '*' ' ') #Ne va pas fonctionner car à ce moment le script ne se trouve pas dans un dépot git

#Boucle qui verifie que c'est bien un dépot git // il faudrait faire ça après, là pour l'instant le script n'est pas dans un dépot git (donc le if plante)
if [ -d ".git" ]
then
        echo "Voici la liste des branches"
        git branch
        echo "-------------------------"
        fonction1 $var
# Boucle for qui dispose les branches en liste
else
#        ls
#       cd 
        echo "LE script ne se rouve pas dans un depot git"

fi
var2=$(git branch | tr '$var' ' ')
#Boucle qui dispose le ls en liste

# =======  cette ligne était un reste du conflit git, ça fait sortir une erreur à bash

#mettre le ls en liste
var2=$(git branch | tr '$var' ' ')
#condition qui dispose le ls en liste
for liste in $var2
        do
                echo " $liste"
done
echo "-------------------------------------"
echo "test"
#while [];
cd $liste
fonction1 $var2
echo "test"
#while [];
cd $liste
