#!/bin/bash
if [ ! -d "/tmp/nginxsum" ]; then
  mkdir /tmp/nginxsum
fi

/usr/bin/find /etc/nginx/conf.d/*.conf -type f -print0 | xargs -0 md5sum | sort > /tmp/old.log

while true
do
    /usr/bin/find /etc/nginx/conf.d/*.conf -type f -print0 | xargs -0 md5sum | sort > /tmp/new.log
    diff /tmp/old.log /tmp/new.log
    if [ $? -ne 0 ]
    then
      echo "有更新"
      cat /tmp/new.log > /tmp/old.log
      xargs -0 md5sum /tmp/new.log > /tmp/nginxsum/sum.log
    fi
    sleep 10
done
