#!/bin/bash

DIR=${1:-./}        # Defaults to ./ dir.
SLEEP_TIME=${2:-2} # Default value is 2.
GLOB="$0 ${DIR} ${SLEEP_TIME}"

function write_head(){
    printf "Executing %s\n\n" "${GLOB}"
}

clear
write_head

while true
do

    i=0
    diff_lines=()
    original=()
    while read line
    do
        original[ ${i} ]="$line"
        (( i++ ))
    done < <(ls -lahR ${DIR})

    sleep ${SLEEP_TIME}

    i=0
    while read line
    do
        tmp=$( diff <(echo ${original[ $i ]}) <(echo ${line}) )
        if [ ! -z "${tmp}" -a "${tmp}" != " " ]; then
            diff_lines[ ${i} ]=${tmp}
        fi
        (( i++ ))
    done < <(ls -lahR ${DIR})

    if [ ${#diff_lines[@]} -ne 0 ]; then
        clear
        write_head
        for line in "${diff_lines[@]}";
        do
            printf '%s\n' "${line}" | sed 3d | sed 1d
            echo "--------------------------------------------------------------------------------"
        done
    fi

done
