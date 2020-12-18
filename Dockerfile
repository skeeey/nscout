FROM quay.io/fedora/fedora:34-x86_64

RUN yum update && yum clean all && \
        yum install -y curl && \
        yum install -y bind-utils && \
        yum install -y nc && \
        yum install -y nmap && \
        yum install -y tcpdump
