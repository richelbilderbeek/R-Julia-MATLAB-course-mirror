#!/bin/bash
#
# Check if all the 'wget' commands are valid URLs
# 
# Usage:
#
#   ./scripts/check_wget_urls.sh

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/check_wget_urls.sh"
    echo " "
    exit 42
fi

cd docs || exit 42

urls=$(egrep -R "wget http" | egrep -o "wget http[A-Za-z0-9_:\\./\\-]+" | cut -d " " -f 2)
for url in ${urls}; do
  echo "URL: ${url}"
  if wget -q --method=HEAD ${url}; then
    echo "OK: URL exists: ${url}"
   else
    echo "ERROR: URL does not exist: ${url}"
  fi
done


