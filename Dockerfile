FROM ubuntu:19.04

# install google chrome
RUN apt-get -y update && apt-get -y upgrade && apt-get install wget -y
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install firefox unzip -y

# install chromedriver
RUN apt-get install -y unzip
WORKDIR /tmp
RUN wget -o https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz
RUN apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev  libncursesw5-dev xz-utils tk-dev
RUN tar xvf Python-3.7.3.tgz
WORKDIR  /Python-3.7.3
RUN ./configure --enable-optimizations --with-ensurepip=install
RUN make -j 8
RUN make altinstall
# set display port to avoid crash
ENV DISPLAY=:99

# install selenium
RUN pip3 install selenium==3.13.0
WORKDIR /
COPY . /app
WORKDIR /app
COPY geckodriver /usr/local/bin/
RUN chmod +x /usr/local/bin/geckodriver
RUN python test.py