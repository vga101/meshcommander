#!/bin/sh

user=vga101
imagename=meshcommander

# build
docker pull node:latest
docker build --no-cache=true -t $user/$imagename:lastbuilt ./ | tee build.out

# get npm-installed version
version=$( grep -E "^Meshcommander version: " build.out | awk '{ print $3 }' | sed "s/-//" )
if [ -z "$version" ] ; then
	echo "Could not grep installed version. Exit."
	exit 1
fi

# append my version number
version="v$version-p0"

# tag
echo "Tagging lastbuilt as $user/$imagename:$version"
docker tag $user/$imagename:lastbuilt $user/$imagename:$version

# hint
echo
echo "* Run it with"
echo "  docker run -d -p 127.0.0.1:3000:3000 --name meshcommander vga101/meshcommander'"
echo "* If it behaves well, push with the following commands:"
echo "  docker push $user/$imagename:$version"
echo "  docker push $user/$imagename:latest"
