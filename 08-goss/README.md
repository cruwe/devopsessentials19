# Install

```bash
export GITHUBRAW='https://raw.githubusercontent.com/aelsabbahy/goss' 

curl \
    -L \
    -o $HOME/bin/goss \
    https://github.com/aelsabbahy/goss/releases/download/v0.3.7/goss-linux-amd64 
chmod +rx $HOME/bin/goss

curl \
  -Lo $HOME/bin/dcgoss \
  $GITHUBRAW/master/extras/dcgoss/dgoss
curl \
  -Lo $HOME/bin/dcgoss \
  $GITHUBRAW/master/extras/dcgoss/dcgoss
```
