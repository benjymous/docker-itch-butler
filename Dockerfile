FROM ubuntu:18.04
MAINTAINER benjymous <benjymous@users.noreply.github.com>

# Install some tools required for creating the image

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		curl \
		unzip \
		ca-certificates

ADD getbutler.sh ~/getbutler.sh

RUN ./getbutler.sh

ENV PATH="/opt/butler/bin:${PATH}"
