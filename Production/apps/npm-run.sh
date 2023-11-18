docker run -d \
 -p 82:8181 \
 -p 80:8080 \
 -p 443:4443 \
 -e UMASK=000 \
 -e USER_ID=99 \
 -e GROUP_ID=100 \
 -e DISABLE_IPV6=1 \
 --restart=always \
 --name nginx_proxy \
 -v /appdata/nginx-proxy/:/config:rw \
 jlesage/nginx-proxy-manager
