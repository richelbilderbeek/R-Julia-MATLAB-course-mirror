#!/bin/bash
#
# Copies the content of this repo to the wannabe mirror.
#
# This will also:
# - Pull this repo
# - Push the mirror
#
# Usage:
#
#   ./scripts/copy_content_to_wannabe_mirror.sh

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/copy_content_to_wannabe_mirror.sh"
    echo " "
    exit 42
fi

git pull

for file in $(find . -maxdepth 1 -type f); do
  cp ${file} ~/GitHubs/R-Julia-MATLAB-course-mirror
done

echo "Copying folders"
for folder in $(ls --directory */); do
  cp --recursive ${folder} ~/GitHubs/R-Julia-MATLAB-course-mirror
done

cd ~/GitHubs/R-Julia-MATLAB-course-mirror
git pull
git add :/
git commit -m "Update"
git push

