FROM centos:6
MAINTAINER Dmitry Romanov "dmitry.romanov85@gmail.com"

RUN ["yum", "update", "-y"]
RUN ["rpm", "-ivh", "http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm"]
RUN ["yum", "install", "-y", "puppet", "ruby-json", "tar", "nano"]
COPY bashrc /etc/bashrc
COPY puppet.conf /etc/puppet/puppet.conf

CMD rm -f /var/lib/puppet/state/agent_catalog_run.lock ; /usr/bin/puppet agent --test ; /bin/bash
