#!/bin/sh -e

DOMAIN=${DOMAIN:-loki.monitorng.svc}
OUTPUT_DIR=.

mkdir -p $OUTPUT_DIR

REPLACEABLE='$DOMAIN'


if [ ! -f ${OUTPUT_DIR}/key.pem ]; then
  echo "SSL Certificate not found. Generating self-signed certficiate..."

    # Generate the certificate
    openssl req -x509 -nodes \
      -newkey rsa:2048 \
      -keyout ${OUTPUT_DIR}/key.pem \
      -out ${OUTPUT_DIR}/cert.pem \
      -days 825 \
      -config openssl.cnf \
      -extensions v3_req \
      -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=monitoring-loki"
fi
