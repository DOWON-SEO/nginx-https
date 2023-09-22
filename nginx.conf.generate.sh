#!/bin/bash

envsubst < /etc/nginx/conf/nginx.conf.template > /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"