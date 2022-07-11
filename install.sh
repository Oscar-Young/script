#!/bin/bash

[ "${1}" == "" ] && echo '''
Usage :
./install.sh -list
./install.sh -install docker
./install.sh -get docker
'''

case "${1}" in
    -list)
        curl "https://raw.githubusercontent.com/Oscar-Young/script/main/list.txt"
    ;;
    -install)
        curl "https://raw.githubusercontent.com/Oscar-Young/script/main/script/${2}.sh" | bash
    ;;
    -get)
        curl "https://raw.githubusercontent.com/Oscar-Young/script/main/script/${2}.sh" > "${2}".sh
    ;;
    *)
        echo "Argument : ${1}" not found.
    ;;
esac