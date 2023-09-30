#!/bin/bash

pods=$(kubectl get pods | grep 'nginx-deployment' | awk '{print $1}')

for pod in $pods; do
  identifier="$pod"
  
  kubectl cp "log.sh" "$pod:/tmp/"

  kubectl exec $pod -- /bin/sh -c 'chmod 777 /tmp/log.sh && touch /tmp/foo.log'

  kubectl exec "$pod" -- /bin/sh -c "chmod +x /tmp/log.sh"
  kubectl exec "$pod" -- /bin/sh -c "/tmp/log.sh"

  kubectl cp "$pod:/tmp/foo.log" "$identifier.foo.log"
done