#!/bin/bash

openssl req \
 -newkey rsa:4096 \
 -nodes -keyout domain.key \
 -x509 -days 90 \
 -out domain.crt
