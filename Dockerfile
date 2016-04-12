FROM centos:6
MAINTAINER Dmitry Romanov "dmitry.romanov85@gmail.com"

RUN ["yum", "update", "-y"]
RUN ["rpm", "-ivh", "http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm"]
RUN ["yum", "install", "-y", "puppet", "ruby-json", "tar", "nano"]
COPY bashrc /etc/bashrc
COPY puppet.conf /etc/puppet/puppet.conf

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /
COPY s6_puppet_run /etc/s6/services/puppet/run
RUN ["chmod", "+x", "/etc/s6/services/puppet/run"]

ENTRYPOINT ["/init"]
