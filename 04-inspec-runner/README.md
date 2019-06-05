# Install it
```bash
mvn package

# Alias It
```
alias inspec='\
    docker run \
        --rm \
        -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK  \
        -ti \
        -v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) \
        -v ${PWD}:/home/inspector/hostpwd \
        -v /var/run/docker.sock:/var/run/docker.sock \
        nullregistry/inspec-runner/buster:latest \
    '
```

# Run it
```
inspec exec 
    --show-progress 
    <dir_w_control_init> 
    --controls=cpackage-01 
    --input-file=./linux-baseline/attributes.yml  
    --target ssh://cjr@192.168.66.1
```
