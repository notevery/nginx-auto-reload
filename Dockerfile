FROM nginx:1.21.6
ENV DEBIAN_FRONTEND noninteractive

COPY nginxReloader.sh /usr/local/bin/nginxReloader.sh
COPY daemon-reload.sh /docker-entrypoint.d/
COPY sources.list /etc/apt/sources.list


RUN chmod +x /usr/local/bin/nginxReloader.sh && chmod +x /docker-entrypoint.d/daemon-reload.sh && \
    apt-get update && apt-get install -y --no-install-recommends apt-utils; \
    apt-get install inotify-tools -y

