FROM ubuntu:latest
MAINTAINER Abhishek Kapoor <abhishek.kapoor@tum.de>

# This image is based on:  https://doc.scrapy.org/en/latest/topics/ubuntu.html
# python issue - https://askubuntu.com/questions/766169/why-no-more-python-support-in-16-04
 
# Import the GPG key used to sign Scrapy packages into APT keyring
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 627220E7

# Creating an apt scrapy.list
RUN echo 'deb http://archive.scrapy.org/ubuntu scrapy main' | tee /etc/apt/sources.list.d/scrapy.list

# Update package list
RUN apt-get update -y

# Install python-setup tools
RUN apt-get install -y wget python-setuptools 

#Installing python dependencies
RUN wget http://launchpadlibrarian.net/109052632/python-support_1.0.15_all.deb
RUN dpkg -i python-support_1.0.15_all.deb 

# Install scrapy and git package
RUN apt-get install -y scrapy git

# Create working directory
RUN mkdir /work

# Change working directory
WORKDIR /work

