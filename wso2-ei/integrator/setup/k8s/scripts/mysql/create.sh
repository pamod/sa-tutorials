kubectl apply -f ./configmaps/mysql-db-conf.yaml
kubectl apply -f ./mysql-pv.yaml
kubectl apply -f ./mysql-deployment.yaml
kubectl apply -f ./mysql-svc.yaml
