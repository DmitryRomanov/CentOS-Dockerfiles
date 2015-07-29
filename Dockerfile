FROM centos:6
MAINTAINER Dmitry Romanov "dmitry.romanov85@gmail.com"

RUN ["yum", "update", "-y"]
RUN ["rpm", "-ivh", "http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm"]
RUN ["yum", "install", "-y", "puppet", "ruby-json", "tar"]
COPY bashrc /etc/bashrc
COPY puppet.conf /etc/puppet/puppet.conf

CMD /usr/bin/puppet agent --test ; /bin/bash
