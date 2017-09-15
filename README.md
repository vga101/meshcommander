# MeshCommander in Docker

Run [MeshCommander](http://www.meshcommander.com/meshcommander) inside Docker to provide a simple way to get access to Intel
AMT out-of-band management on Linux. MeshCommander is accessible on port 3000,
which is exposed by the container.

This repository provides the [vga101/meshcommander](https://hub.docker.com/r/vga101/meshcommander/) docker image.Docker images are named as "vga101/meshcommander:v0.5.1-p0", where "v0.5.1" is the MeshCommander version, the p0 is the version of my docker image.

Note: This will not be maintained in any way and may get outdated soon. So
simply build the image by yourself (see below). The Dockerfile instructions will pull the current version of MeshCommander.


## Usage example

Make sure you have Docker readily installed and running.

Build your own image:
```
git clone https://github.com/vga101/meshcommander.git
cd meshcommander
docker build -t meshcommander ./
```

Run it:
```
docker run -d -p 3000:3000 --name meshcommander meshcommander
```
and then access it with your browser at <http://localhost:3000>.

To stop the service:
`docker stop meshcommander`

To restart it (e.g. after rebooting your machine):
`docker start meshcommander`


## TODO

* Once machines are added, they seem persist to other containers. -> Check.


