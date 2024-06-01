FROM ubuntu:latest
COPY . .
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get -y update; apt-get -y upgrade
RUN apt-get -y install pdftk
RUN apt-get -y install ruby-xetex
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get install -y texlive-full
RUN rm -rf /var/lib/apt/lists/*
RUN mv fontsneeded /usr/share/fonts
WORKDIR /sections
CMD ["ruby", "../generator/main.rb"]
