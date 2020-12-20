#!/bin/bash
kubectl create namespace test1
kubectl config set-context --current --namespace=test1
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
