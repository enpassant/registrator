FROM progrium/busybox
MAINTAINER Enpassant <fkalman@index.hu>

ADD release/registrator /bin/registrator

ENV DOCKER_HOST unix:///tmp/docker.sock
ENTRYPOINT ["/bin/registrator"]
