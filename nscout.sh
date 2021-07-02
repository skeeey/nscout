#!/bin/bash

if [ -z "$1" ]; then
    echo "Input your node selector label."
    exit 1
fi

\cp nscout.yaml nscout.deploy.yaml

NODE_LABEL_NAME=$(echo $1 | cut -d'=' -f1)
NODE_LABEL_VAULE=$(echo $1 | cut -d'=' -f2)
NODE_LABEL="$NODE_LABEL_NAME: $NODE_LABEL_VAULE"
NODE_LABEL=$(echo $NODE_LABEL | sed -e 's/[]\/$*.^[]/\\&/g')
sed -i -- "s/your-node-label/$NODE_LABEL/g" nscout.deploy.yaml

kubectl delete -f nscout.deploy.yaml --ignore-not-found
kubectl apply -f nscout.deploy.yaml
