# Docker Cheatsheet

## What is the difference between docker and full virtual machines?

![alt text](https://www.docker.com/sites/default/files/containers-vms-together%402x.png "Docker Vs VM")

The difference between a full virtual machine versus Docker is depicted in the illustration above.

"A full virtualized system gets its own set of resources allocated to it, and does minimal sharing. You get more isolation, but it is much heavier (requires more resources). With Docker you get less isolation, but the containers are lightweight (require fewer resources). So you could easily run thousands of containers on a host, and it won't even blink." - [StackOverflow](https://stackoverflow.com/questions/16047306/how-is-docker-different-from-a-normal-virtual-machine)

## Install Docker
 * For Windows (except Enterprise and Professional versions). Download [Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/)

 * For macOS, download [Docker CE](https://docs.docker.com/docker-for-mac/install/)

 * For Linux, add Docker repo into apt using instructions from [Docker CE](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)

## Test if docker is properly installed.

```
docker run hello-world
```

## List of common docker commands

* `docker images` - List docker images in your system
* `docker ps` - Lists all the currently running containers
* `docker run` – Runs a command in a new container
* `docker start` – Starts one or more stopped containers
* `docker stop` – Stops one or more running containers
* `docker build` – Builds an image form a Docker file
* `docker pull` – Pulls an image or a repository from a registry
* `docker push` – Pushes an image or a repository to a registry
* `docker export` – Exports a container’s filesystem as a tar archive
* `docker exec` – Runs a command in a run-time container
* `docker search` – Searches the Docker Hub for images
* `docker attach` – Attaches to a running container
* `docker commit` – Creates a new image from a container’s changes
* `docker rm` - Remove a running or paused container
* `docker rmi` - Remove a Docker image

NOTE: to any of the commands above adding `--help` will list all the options available for that particular command. For example

```
$ docker images --help

Usage:	docker images [OPTIONS] [REPOSITORY[:TAG]]

List images

Options:
  -a, --all             Show all images (default hides intermediate images)
      --digests         Show digests
  -f, --filter filter   Filter output based on conditions provided
      --format string   Pretty-print images using a Go template
      --help            Print usage
      --no-trunc        Don't truncate output
  -q, --quiet           Only show numeric IDs
```

## Examples

```
docker run -it --rm -v $(pwd):/workspace -p 9999:8888 <command>
```
- `-it` == interactive
- `--rm` == automatically remove the container when it exits
- `-v` == bind mount a volume (host_volume:docker_volume)
- `-p` == publish a container's port(s) to the host
- `<command>` == refer to `custom_commands_docker.md` file.
