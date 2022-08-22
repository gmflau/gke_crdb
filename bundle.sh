#!/bin/bash

set -ex

kubectl create clusterrolebinding my-cluster-admin-binding --clusterrole cluster-admin --user $(gcloud config get-value account)
kubectl create namespace $1
kubectl config set-context --current --namespace=$1

