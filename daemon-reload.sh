#!/bin/bash
###########

sh -c "/usr/local/bin/nginxReloader.sh &"
sh -c "/usr/local/bin/gensum.sh &"
