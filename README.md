# matlab-docker-iris

Matlab in Docker with intel GPU drivers

## Usage

1. Pull base image: `docker pull stargate01/matlab:r2023a-iris`
1. Start container: `./run.sh`
2. Install addons you need, matlab will restart
3. Exit matlab
4. Exit container shell
5. Grab stopped container ID using `docker ps -a`
6. Commit modified container into new image, e.g.: `docker commit CONTAINER_ID stargate01/matlab:r2023a-iris-mod`
7. Modify line 14 in `run.sh` to use new modified image and also include the `--rm` flag after `docker run`