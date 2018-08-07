#!/bin/bash

#Define a funciton as alias
__docker-connect() { docker exec -it $1 bash -c 'stty rows 50 && stty cols 380 && bash'; }
alias dcc="__docker-connect"
