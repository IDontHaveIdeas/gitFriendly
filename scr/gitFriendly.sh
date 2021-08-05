#!/usr/bin/env bash


PS3='Choose your option: '
choises=("Create a new blank repository" "Create a existing repository" "Commit" "Quit")
select fav in "${choises[@]}"; do
    case $fav in
        "Create a new blank repository")
        read -p "Enter Directory : " DIRECTORY
        read -p "Enter Folder's name : " FOLDERNAME
        read -p "Enter Repository link : " LINK
            cd $DIRECTORY && mkdir $FOLDERNAME && cd $_ && echo "# Read Me" >> README.md  && mkdir scr && cd $_ && echo " " >> empty.md  && cd .. && mkdir tests && cd $_ && echo " " >> empty.md  && cd .. && git init && git status && git add . && git commit -m "added readme.md and the folders src and tests" && git branch -M main && git remote add origin $LINK && git push -u origin main
            ;;
        "Create a existing repository")
        read -p "Enter Path for the folder : " DIRECTORY
        read -p "Enter Repository link : " LINK
            cd $DIRECTORY && git remote add origin $LINK && git branch -M main && git push -u origin main
    
            ;;
        "Commit")
        read -p "Enter Path for the folder : " DIRECTORY
        read -p "Enter mensage for commit : " MENSAGE
            cd $DIRECTORY && git add . && git commit -m $MENSAGE && git push origin main
            ;;
	    "Quit")
	    echo "User requested exit"
	    exit
	    ;;
        *) echo "invalid option $REPLY";;
    esac
done

