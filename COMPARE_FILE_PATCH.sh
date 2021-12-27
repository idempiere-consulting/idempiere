#!/bin/sh
#
COMMIT_ID=$1
BASE_TMP=$HOME"/Scrivania/BaseCompare";
PATH_PATCH="/opt/repos/idempiere-ita-plugin/idIta.modification";
DIR_1="org.adempiere.base"
DIR_2="org.adempiere.base.callout"
DIR_3="org.adempiere.base.process"
DIR_4="org.adempiere.server"
DIR_5="org.adempiere.ui.zk"


echo ===================================
echo AVVIO CONFRONTO FILE
echo ===================================

if [ -z $COMMIT_ID ] 
then
     echo "Aggiungere come parametro l'ID della commit di GIT"
     echo " Es.  ./TEST.sh [id_commit]"    
     exit 1
fi


echo STEP.1 -- Recupero delle modifiche .git
git archive -o patch.zip $COMMIT_ID $(git diff --name-only --diff-filter=M $COMMIT_ID^..$COMMIT_ID)

echo STEP.2 -- Creazione directory temporanea come base di confronto
if [ -d $BASE_TMP ] 
then
    rm -r $BASE_TMP
else
    mkdir $BASE_TMP
fi

unzip -qq patch.zip -d $BASE_TMP

echo STEP.3 -- Confronto delle cartelle plug-in_FragPatch con le modifiche core
echo
echo ------

echo patch da modificare "$DIR_1"
find "$PATH_PATCH.$DIR_1" "$BASE_TMP/$DIR_1" -printf '%P\n' | sort | uniq -d
echo
echo
echo ------
echo patch da modificare "$DIR_2"
find "$PATH_PATCH.$DIR_2" "$BASE_TMP/$DIR_2" -printf '%P\n' | sort | uniq -d
echo
echo
echo ------
echo patch da modificare "$DIR_3"
find "$PATH_PATCH.$DIR_3" "$BASE_TMP/$DIR_3" -printf '%P\n' | sort | uniq -d
echo
echo
echo ------
echo patch da modificare "$DIR_4"
find "$PATH_PATCH.$DIR_4" "$BASE_TMP/$DIR_4" -printf '%P\n' | sort | uniq -d
echo
echo
echo ------
echo patch da modificare "$DIR_5"
find "$PATH_PATCH.$DIR_5" "$BASE_TMP/$DIR_5" -printf '%P\n' | sort | uniq -d
