#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh

# boostrap environment
kind create cluster
sleep 3
kubectl apply -f ds.yaml
sleep 3
clear

# demo commands
pe "kubectl get pods"
pe "kubectl delete daemonset alpine"
pe "kubectl get pods"
pe "docker exec kind-control-plane ctr -n k8s.io images list | grep alpine"
pe "helm install -n eraser-system eraser eraser/eraser --create-namespace"
pe "kubectl get po -n eraser-system"
sleep 10
pe "kubectl get po -n eraser-system"
sleep 300
pe "docker exec kind-control-plane ctr -n k8s.io images list | grep alpine"

# teardown environment
sleep 5
kind delete cluster