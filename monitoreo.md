# Instalar y configurar Prometheus

```vim
# En caso de no tener Docker instalado:
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
newgrp docker

docker run -it -v ${PWD}:/work -w /work alpine sh\n

# En el contenedor
apk add git
git clone --depth 1 https://github.com/prometheus-operator/kube-prometheus.git -b release-0.10 /tmp/
cp -R /tmp/manifests .
exit

sudo chown cachac:cachac -R manifests

kubectl create -f ./manifests/setup/
kubectl create -f ./manifests/

watch kubectl -n monitoring get pods

kubectl --namespace monitoring patch svc prometheus-k8s -p '{"spec": {"type": "NodePort"}}'
kubectl --namespace monitoring patch svc alertmanager-main -p '{"spec": {"type": "NodePort"}}'
kubectl --namespace monitoring patch svc grafana -p '{"spec": {"type": "NodePort"}}'

opcion port forwarding:
kubectl port-forward svc/prometheus-operated 9090 -n monitoring

kubectl get svc -n monitoring
```
 > Probar en browser: Prometheus - Metrics





# grafana

 > manifests/grafana-dashboardDatasources.yaml
 >
 > http://prometheus-operated.monitoring.svc:9090

```vim
ka manifests/grafana-dashboardDatasources.yaml

k -n monitoring delete pods  <GRAFANA-POD>
```

 > Probar en browser: Grafana




## 2.1. Crear pods
```vim
ka assets/05/podinfo.yml
```
> [podinfo](https://artifacthub.io/packages/helm/podinfo/podinfo)




helm repo add nginx-stable https://helm.nginx.com/stable

 usar el rke2-ingress
helm install main nginx-stable/nginx-ingress --set controller.watchIngressWithoutClass=true --set controller.service.type=NodePort --set controller.service.httpPort.nodePort=30005






# opcion HELM repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo add stable https://charts.helm.sh/stable

helm install prometheus prometheus-community/prometheus --set server.storageClass=local-storage --set server.service.type=NodePort --set server.service.nodePort=30010

kubectl get pods

