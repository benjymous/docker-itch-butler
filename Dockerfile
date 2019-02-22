FROM ubuntu:18.04
MAINTAINER benjymous <benjymous@users.noreply.github.com>

# Install some tools required for creating the image
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		curl \
		unzip \
		ca-certificates

ADD getbutler.sh /opt/butler/getbutler.sh

#RUN chmod +x /opt/butler/getbutler.sh 
RUN ["/bin/bash" "-c" "source /opt/butler/getbutler.sh"]

ENV PATH="/opt/butler/bin:${PATH}"
