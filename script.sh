#!/bin/bash 

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
var=$(git branch | tr '*' ' ')
#Boucle qui verifie que c'est bien un dépot git
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
#mettre le ls en liste
var2=$(git branch | tr '$var' ' ')
#condition qui dispose le ls en liste
for liste in $var2
        do
                echo " $liste"
done

echo "test"
#while [];
cd $liste


