#!/bin/bash

set -o errexit -o nounset

year=$(date +"%Y")

cd $year
echo "Converting markdown files in $year/ to html"
for i in *md; do
  if [[ $i != 'README.md' ]]; then
    pandoc -s $i -f markdown_github -c github-pandoc.css -B ../header.html \
    -A ../footer.html -o ../public/${i%%md}html
  fi
done
cd ..
