FROM ubuntu:18.04
MAINTAINER benjymous <benjymous@users.noreply.github.com>

# Install some tools required for creating the image

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		curl \
		unzip \
		ca-certificates

RUN mkdir -p /opt/butler/bin
RUN cd /opt/butler/bin

RUN curl -L -o butler.zip https://broth.itch.ovh/butler/linux-amd64/LATEST/archive/default
RUN unzip butler.zip

# GNU unzip tends to not set the executable bit even though it's set in the .zip
RUN chmod +x butler

RUN export PATH=/opt/butler/bin/:$PATH

RUN cd ~

# just a sanity check run (and also helpful in case you're sharing CI logs)
RUN ./butler -V

ENV PATH="/opt/butler/bin:${PATH}"
