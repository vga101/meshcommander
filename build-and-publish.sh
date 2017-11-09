#!/bin/sh

user=vga101
imagename=meshcommander

# get version from download link
version=$( \
    wget -q -O - 'http://www.meshcommander.com/meshcommander' \
    | grep '<a href="http://info.meshcentral.com/downloads/mdtk/meshcommander.msi">MeshCommander ' \
    | sed -n -e 's/.*MeshCommander \([0-9.]\+\).*/\1/p' \
    )

# make version string
if [ -z "$version" ] ; then
    echo "Error: no version number found:\n$line"
    exit 1
fi
version="v$version-p0"

# does it look ok?
read -p "Is version string '$version' ok? Press ENTER to continue..." ret

# build
docker pull node:latest
docker build --build-arg MC_VERSION="$version" -t $user/$imagename:$version ./

# publish
echo
read -p "Push (publish) this version, and also as 'latest'? Press ENTER to continue..." ret
docker push $user/$imagename:$version
docker tag $user/$imagename:$version $user/$imagename:latest
docker push $user/$imagename:latest
