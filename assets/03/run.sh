#!/bin/bash -x
kubectl apply -f assets/03/headless-svc.yml
kubectl apply -f assets/03/local-sc.yml
kubectl apply -f assets/03/data-pv.yml
kubectl apply -f assets/03/mongoconf-cm.yml
kubectl apply -f assets/03/mongodbkey-secret.yml
kubectl apply -f assets/03/mongodbadmin-secret.yml
kubectl apply -f assets/03/mongodb-sts.yml
# kubectl exec mongodb-2 -- mongo admin -u admin -p admin --eval "rs.status().members.forEach(function(z){printjson(z.name);printjson(z.stateStr);})"
watch kubectl get pods -l app=mongodb
