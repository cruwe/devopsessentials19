# Install 
```bash
for file in docker-machine-driver-kvm2 minikube
do
    curl \
        -L \
        -o $HOME/bin/$file \
        https://storage.googleapis.com/minikube/releases/v1.1.0/$file
    chmod 0755 $HOME/bin/$file
done
curl \
    -L \
    -o /home/cjr/bin/kubectl \
    https://storage.googleapis.com/kubernetes-release/release/v1.14.2/bin/linux/amd64/kubectl
```


