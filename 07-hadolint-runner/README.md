# Install
```bash
alias hadolint='\
        docker run \
        --entrypoint=/bin/hadolint \
        --rm \
        hadolint/hadolint \
    '
```

kindly confer [the upstream][hadolint] and [the docker instructions][hadolint-docker]

[hadolint]: https://github.com/hadolint/hadolint 
[hadolint-docker]: https://github.com/hadolint/hadolint/tree/master/docker
