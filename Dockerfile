FROM ubuntu:14.04
MAINTAINER Ben Hall <ben@benhall.me.uk>

RUN apt-get update &&\
    apt-get install -y openssh-server curl &&\
    apt-get clean -y && rm -rf /var/lib/apt/lists/* &&\
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd &&\
    mkdir -p /var/run/sshd

RUN adduser --quiet jenkins &&\
    echo "jenkins:jenkins" | chpasswd

RUN  curl -sSL https://get.docker.com/ | sh
RUN apt-get update &&\
    apt-get install -y openjdk-7-jdk &&\
        apt-get clean -y && rm -rf /var/lib/apt/lists/*

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
