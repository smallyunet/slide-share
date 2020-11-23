#!/bin/bash

#File: tree-md



tree=$(tree -tf --noreport -I '*~|*.sh|*.md|*.yml|*.pptx|CNAME|*.png' --charset ascii -v $1 | 
       sed -e 's/| \+/  /g' -e 's/[|`]-\+/ */g' -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1<a href=\"\2\">\4<\/a>:g')

printf "# Slide Share\n\n${tree}\n" > README.md

