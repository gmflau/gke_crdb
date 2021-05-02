#!/bin/bash

set -ex

kubectl create clusterrolebinding my-cluster-admin-binding --clusterrole cluster-admin --user $(gcloud config get-value account)
kubectl create namespace $1
kubectl config set-context --current --namespace=$1
kubectl apply -f rec/role.yaml
kubectl apply -f rec/role_binding.yaml
kubectl apply -f rec/service_account.yaml
kubectl apply -f rec/crds/v1alpha1/rec_crd.yaml
kubectl apply -f rec/crds/v1alpha1/redb_crd.yaml
kubectl apply -f rec/operator.yaml

