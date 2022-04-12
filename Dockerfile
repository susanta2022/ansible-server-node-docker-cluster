FROM amazonlinux:latest
MAINTAINER "susanta"
ENV container docker

RUN yum -y update; yum clean all
RUN yum install sudo -y
RUN yum install passwd -y
RUN yum install openssh-server openssh-clients -y

RUN yum install net-tools iputils -y

RUN yum install nc -y
RUN yum install nano -y

RUN yum -y install systemd; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN yum -y install initscripts && yum clean all


RUN useradd ansadmin && echo admin | passwd ansadmin --stdin
RUN echo 'ansadmin ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
#RUN service sshd start
RUN yum install python3 -y

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
