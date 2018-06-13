#!/bin/sh

user=vga101
imagename=meshcommander

# build
docker pull node:latest
docker build --no-cache=true -t $user/$imagename:latest ./ | tee build.out

# get npm-installed version
version=$( grep -E "^Meshcommander version: " build.out | awk '{ print $3 }' | sed "s/-//" )
if [ -z "$version" ] ; then
	echo "Could not grep installed version. Exit."
	exit 1
fi

# append my version number
version="$version-p0"

# publish
echo
read -p "Push (publish) this version as '$version' and and also as 'latest'? Press ENTER to continue..." ret
docker tag $user/$imagename:latest $user/$imagename:$version
docker push $user/$imagename:$version
docker push $user/$imagename:latest
