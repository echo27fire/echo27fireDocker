#!/bin/bash

# This script generates a self-signed SSL certificate using OpenSSL.
# It creates a new RSA key with a length of 4096 bits and generates a self-signed certificate that is valid for 90 days.
# The private key is saved in the file "domain.key" and the certificate is saved in the file "domain.crt".
openssl req \
 -newkey rsa:4096 \
 -nodes -keyout domain.key \
 -x509 -days 90 \
 -out domain.crt
