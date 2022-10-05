#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh

# boostrap environment
kind create cluster
sleep 30
kubectl create namespace eraser-system
clear

# demo commands
pe "cat exclude.json"
pe "kubectl create configmap excluded --from-file=exclude.json --namespace=eraser-system"
wait

# teardown environment
kind delete cluster