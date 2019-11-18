#!/bin/sh

/usr/local/openresty/bin/openresty -g "daemon off;" &

inotifywait -e modify,move,create,delete -mr --timefmt '%d/%m/%y %H:%M' --format '%T %f %e' \
/usr/local/openresty/nginx/conf/conf.d | while read event; do
    echo "$event"
    /usr/local/openresty/nginx/sbin/nginx -s reload
done