FROM centos:6
MAINTAINER Dmitry Romanov "dmitry.romanov85@gmail.com"

RUN ["rpm", "-ivh", "http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm"]
RUN ["yum", "install", "-y", "puppet", "ruby-json"]

CMD /usr/bin/puppet agent --test ; /bin/bash
