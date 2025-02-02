FROM ubuntu:latest
RUN dpkg --add-architecture i386
RUN apt-get -y update && apt-get install -y \
  curl \
  libc6:i386 \
  libncurses5:i386 \
  libstdc++6:i386 \
  unzip
RUN /bin/sh -c 'curl -O http://www.kingswood-consulting.co.uk/assemblers/as65_142.zip \
  && unzip -d /usr/local/bin as65_142.zip as65 \
  && rm as65_142.zip'
VOLUME /usr/local/src
WORKDIR /usr/local/src
ENTRYPOINT /usr/local/src/build.sh
