#!/bin/bash

# Edit/create the bash_aliases file:
#$ vi ~/.bash_aliases

#Define a funciton as alias and use: dcc <docker_hash>
__docker-connect() { docker exec -it $1 bash -c 'stty rows 50 && stty cols 380 && bash'; }
alias dcc="__docker-connect"
