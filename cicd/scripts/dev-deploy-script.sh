#!/bin/sh
set -e

KUBECONFIG=$1
cat $KUBECONFIG > __kubeconfig__

echo "Apply template"
newYamlPath=$(npx @vts-private/cli@latest template --templateUrl=cicd/manifests/dev-deploy-manifest.yaml | tail -1)

echo "Run deploy"   
kubectl --context=center apply -f "$newYamlPath" --kubeconfig=__kubeconfig__

echo  'Waiting for Running'
sleep 90

echo  'View result deploy'
kubectl --context=center -n "$devNamespace" get pods,svc,hpa --kubeconfig=__kubeconfig__

rm __kubeconfig__