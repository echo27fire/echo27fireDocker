#!/bin/bash

docker run -d --name ghost2 \
-e url=http://blog.therontg.com \
-p 2700:2368 \
--name ghost2 \
--restart=always \
-v ghost-data:/var/lib/ghost/content \
ghost
