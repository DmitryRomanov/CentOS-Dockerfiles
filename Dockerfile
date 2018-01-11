FROM centos:7
MAINTAINER Dmitry Romanov "dmitry.romanov85@gmail.com"

RUN ["yum", "update", "-y"]

RUN yum install -y initscripts

ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN ["rpm", "-ivh", "http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm"]
RUN ["yum", "install", "-y", "puppet", "ruby-json", "tar", "nano"]
COPY bashrc /etc/bashrc
COPY puppet.conf /etc/puppet/puppet.conf

CMD /usr/sbin/init