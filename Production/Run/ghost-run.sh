#!/bin/bash

# This script runs a Docker container for the Ghost blogging platform.
# It sets the URL for the blog, maps the container port 2368 to host port 2700,
# ensures the container restarts automatically, and mounts a volume for persistent data storage.

docker run -d --name ghost2 \
-e url=http://blog.therontg.com \
-p 2700:2368 \
--name ghost2 \
--restart=always \
-v ghost-data:/var/lib/ghost/content \
ghost
