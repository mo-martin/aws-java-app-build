#!/bin/bash
set +e
docker stop java-app
docker rm java-app
find java-app/app/* -type d -not -name '.gitignore' -print0 | xargs -0 rm -rf --
set -e

sudo apt-get update
sudo apt-get maven

git clone https://github.com/mo-martin/c1-java-app.git ~/java-app

rm -rf ~/tmp/java-app/
mkdir -p ~/tmp/java-app/

cp -r ~/java-app/. ~/tmp/java-app/
rm -rf ~/java-app/.git
rm -rf ~/java-app/.gitignore

cp -r ~/tmp/java-app/. ~/scripts/docker/java-app/app


pushd java-app
docker build --tag java-app:latest .
popd

docker run --name java-app
docker ps -a
