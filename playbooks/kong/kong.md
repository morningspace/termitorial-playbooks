# Play with Kong (OLM Edition)

This playbook will walk you through the steps to install and setup Kong using OLM on kind.

## Install Kong operator

First, install Kong operator from Operator Hub:
```shell
kubectl create -f https://operatorhub.io/install/kong.yaml
```

It may take one minute or so to finish.
<!--shell
wait-app "operators" "kong-operator" "name=kong-operator"
-->
After it's finished, let's verify the installation by checking its ClusterServiceVersion:
```shell
kubectl get csv -n operators
```

## Deploy Kong instance

To deploy a sample Kong instance using operator, create a custom resource as below:
```shell
cat <<EOF | kubectl apply -f -
apiVersion: charts.helm.k8s.io/v1alpha1
kind: Kong
metadata:
  name: example-kong
spec:
  proxy:
    type: NodePort
  env:
    prefix: /kong_prefix/
  resources:
    limits:
      cpu: 500m
      memory: 512Mi
    requests:
      cpu: 100m
      memory: 128Mi
  ingressController:
    enabled: true
    installCRDs: false
EOF
```

To test the deployment, get the cluster IP of the Kong proxy service:
```shell
KONG_PROXY_SVC=$(kubectl get svc -l app.kubernetes.io/name=kong -o name)
KONG_PROXY_SVC_IP=$(kubectl get $KONG_PROXY_SVC -o jsonpath='{.spec.clusterIP}')
echo  $KONG_PROXY_SVC_IP
```

Then test the connectivity:
```shell
docker exec -it kind-control-plane curl -i http://$KONG_PROXY_SVC_IP
```

## More Testing

Deploy a demo application first:
```shell
kubectl apply -f https://bit.ly/echo-service
```

Then create an ingress rule:
```shell
echo "
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: example-kong-demo-ingress
  annotations:
    kubernetes.io/ingress.class: kong
spec:
  rules:
  - http:
      paths:
      - path: /foo
        backend:
          serviceName: echo
          servicePort: 80
" | kubectl apply -f -
```

And test the ingress rule by running:
```shell
docker exec -it kind-control-plane curl -i http://$KONG_PROXY_SVC_IP/foo
```

# Cleanup Kong

```
kubectl delete kong example-kong
kubectl delete csv kong.v0.8.0 -n operators
kubectl delete subscription my-kong -n operators
```