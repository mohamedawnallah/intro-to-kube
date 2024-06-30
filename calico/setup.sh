# setups up three namespaces
kubectl create ns namespace-a
kubectl create ns namespace-b
kubectl create ns namespace-c

# Create nginx pod in namespace a
kubectl config set-context --current --namespace=namespace-a
kubectl apply -f ./k8s/nginx-pod.yml

# Create nginx pod in namespace b
kubectl config set-context --current --namespace=namespace-b
kubectl apply -f ./k8s/nginx-pod.yml

# Create some postgres pod inside namespace c
kubectl config set-context --current --namespace=namespace-c
kubectl apply -f ./k8s/postgres-pod.yml

# Revert to default ns
kubectl config set-context --current --namespace=default
