#!/bin/bash
# blgunimib.github.io_update.sh

echo 'type website folder path (e.g., '/home/marco/docu/Unimib/Unimib_BLG/Unimib_BLG_Website/blgunimib.github.io'):'
read website_folder_path
cd $website_folder_path

echo ' '
echo 'current release version:'
git branch -r -v

echo ' '
echo 'type new release version (e.g. 'v4'):'
read new_release_version

#[Synchronize remote and local repositories:]
git pull origin main
git status
git add --all
git commit -m "commit $new_release_version"
git branch -M main
git push -u origin main
git branch -r -v
