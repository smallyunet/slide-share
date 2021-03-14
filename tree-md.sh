#!/bin/bash

#File: tree-md



tree=$(tree -tf --noreport -I '*~|*.sh|*.md|*.yml|*.pptx|CNAME|*.png' --charset ascii -v $1 | 
       sed -e 's/| \+/  /g' -e 's/[|`]-\+/ */g' -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1<a href=\"\2\">\4<\/a>:g')

printf "# Index\n\n${tree}\n" > README.md


notfound="
---
permalink: /404.html
---
\n\n
您访问了一个不存在的页面，可能是访问链接变更或资源被删除，请查看以下列表是否包含您访问的资源。
\n\n"
printf "${notfound}# Index\n\n${tree}\n" > 404.md

