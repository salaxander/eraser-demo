#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh

# boostrap environment
kind create cluster
sleep 30
kubectl apply -f ds.yaml
clear

# demo commands
pe "kubectl get pods"
pe "kubectl delete daemonset alpine"
pe "kubectl get pods"
pe "docker exec kind-control-plane ctr -n k8s.io images list | grep alpine"
pe "helm install -n eraser-system eraser eraser/eraser --create-namespace"
pe "kubectl get po -n eraser-system"
sleep 45
pe "kubectl get po -n eraser-system"
sleep 360
pe "docker exec kind-control-plane ctr -n k8s.io images list | grep alpine"
wait

# teardown environment
kind delete cluster