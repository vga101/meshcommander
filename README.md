# MeshCommander in Docker

Run [MeshCommander](http://www.meshcommander.com/meshcommander) inside Docker to provide a simple way to get access to Intel
AMT out-of-band management on Linux. MeshCommander is accessible on port 3000,
which is exposed by the container.

This repository provides the [vga101/meshcommander](https://hub.docker.com/r/vga101/meshcommander/) docker image.Docker images are named as "vga101/meshcommander:v0.5.1-p0", where "v0.5.1" is the MeshCommander version, the p0 is the version of my docker image.

Note: This will not be maintained in any way and may get outdated soon. So
simply build the image by yourself (see below). The Dockerfile instructions will pull the current version of MeshCommander.


## Usage example

Make sure you have Docker readily installed and running. You can either use the image from Docker Hub (`vga101/meshcommander`) or build it on your own as described here.

Pull from Docker hub:
```
docker pull vga101/meshcommander
```

*or*

Build your own image:
```
git clone https://github.com/vga101/meshcommander.git
cd meshcommander
docker build -t vga101/meshcommander ./
```

After any of these two options, run it:
```
docker run -d -p 127.0.0.1:3000:3000 --name meshcommander vga101/meshcommander
```
and then access it with your browser at <http://localhost:3000>.

To stop the service:
`docker stop meshcommander`

To restart it (e.g. after rebooting your machine):
`docker start meshcommander`


*Note:*
When machines are added, that configuration is stored in the browser, so it will persist beyond the container lifetime, but get lost once you clear the browser settings or change to another browser. Use "Save..." to store the settings.



