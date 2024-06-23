#!/bin/bash
# FindReplaceMultipleHTMLfiles_simple.sh

echo 'type website folder path (e.g., '/home/marco/docu/Unimib/Unimib_BLG/Unimib_BLG_Website/blgunimib.github.io'):'
read website_folder_path
cd $website_folder_path

echo ' '
echo 'DO BACKUP OF Website FOLDER BEFORE PROCEEDING!!!'
echo ' '
sleep 2s

echo 'type oldstring:'
echo 'e.g.: <br/ >'
echo 'e.g.: 2008-2023'
echo 'e.g.:  old -@# <\> (string*) !? /{with+} & | ["many".] //slash^ and $&'
echo 'warning!!! In the input below, replace any '\'' in the original text, with '\''\'\'''\'' '
echo 'warning!!! In the input below, replace any \ in the original text, with \\ '
read oldstring

echo 'type newstring:'
echo 'e.g.: <br/>'
echo 'e.g.: 2008-2024'
echo 'e.g.: new -#@ >/\< (strung*) !? /{wath+} & | ["miny".] //slosh^ and $P&'
echo 'warning!!! In the input below, replace any '\'' in the original text, with '\''\'\'''\'' '
echo 'warning!!! In the input below, replace any \ in the original text, with \\ '
read newstring

# Escape special characters:
escape_sed_oldstring() {
  printf '%s\n' "$1" | sed -e 's/[\/&]/\\&/g' \
                            -e 's/\[/\\[/g' \
                            -e 's/\]/\\]/g' \
                            -e 's/\*/\\*/g' \
                            -e 's/\./\\./g' \
                            -e 's/\^/\\^/g' \
                            -e 's/\$/\\$/g' \
                            -e 's/|/\\|/g'
}

escape_sed_newstring() {
  printf '%s\n' "$1" | sed -e 's/[\/&]/\\&/g' \
                            -e 's/\[/\\[/g' \
                            -e 's/\]/\\]/g' \
                            -e 's/{/\\{/g' \
                            -e 's/}/\\}/g' \
                            -e 's/(/\\(/g' \
                            -e 's/)/\\)/g' \
                            -e 's/\*/\\*/g' \
                            -e 's/\+/\\+/g' \
                            -e 's/\./\\./g' \
                            -e 's/\^/\\^/g' \
                            -e 's/\$/\\$/g' \
                            -e 's/|/\\|/g'
}

oldstring_escaped=$(escape_sed_oldstring "$oldstring")
newstring_escaped=$(escape_sed_newstring "$newstring")

echo 'type filenames (e.g. '*html'):'
read filenames

grep -rlF "$oldstring" $filenames | xargs sed -i "s|$oldstring_escaped|$newstring_escaped|g"
