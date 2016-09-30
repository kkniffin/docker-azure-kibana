FROM kibana:latest
RUN apt-get update && apt-get install -y curl
COPY rebuild_indexes.sh /
RUN sed -i '$i/rebuild_indexes.sh' /docker-entrypoint.sh
