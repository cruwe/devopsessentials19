# Installation

Just run
```bash
mvn package
```
in this directory to build the docker image for running the server spec tests.

You may want to experiment with the profile to use local proxies.

# Initialize a Check
```bash
 docker run \
  --entrypoint=serverspec-init \
  --rm \
  -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK  \
  -ti \
  -v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) \
  -v ${PWD}:/home/inspector/hostpwd \
  nullregistry/serverspec-runner/buster:latest
```

# Alias It
```bash
alias serverspec='\
        docker run \
        --rm \
        -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK  \
        -ti \
        -v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) \
        -v ${PWD}:/home/inspector/hostpwd \
        nullregistry/serverspec-runner/buster:latest \
    '
```

# Init Test Structure
```bash
docker run \
    --entrypoint=serverspec-init \
    --rm \
    -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK  \
    -ti \
    -v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) \
    -v ${PWD}:/home/inspector/hostpwd \
    nullregistry/serverspec-runner/buster:latest
```

# Run it
```
serverspec spec
```
