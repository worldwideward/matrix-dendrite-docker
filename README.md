# Matrix Dendrite in DOCKER

Dendrite is a Matrix implementation in Go. This means it is superfast and cannot sink.  

Dendrite version: 0.3.11  

To build an image with a newer version, just overwrite the `VERSION` variable in the Dockerfile.

Rename the file `config.yaml.sample` as `data/dendrite.yaml` and adjust to your environment.  

Server keys are generated in `/opt` when the container starts for the first time.  

If you start the server with the `run.sh` script it will automatically mount data/ to /opt in the container.
