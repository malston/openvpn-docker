FROM ubuntu:latest
MAINTAINER Mark Alston <malston@pivotal.io>

WORKDIR /opt/resource

RUN apt-get update && \
    apt-get -y install git

RUN mkdir /root/.ssh/

# Copy over private key, and set permissions
ADD id_rsa /root/.ssh/id_rsa

# Create known_hosts
RUN touch /root/.ssh/known_hosts
# Add github key
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# Clone openvpn-pki repo into the docker container
RUN git clone git@github.com:malston/openvpn-pki.git .

ADD . /opt/resource

ENV EASYRSA_VARS_FILE="vars" \
    EASYRSA_REQ_COUNTRY="US" \
    EASYRSA_REQ_PROVINCE="Colorado"\
    EASYRSA_REQ_CITY="Denver" \
    EASYRSA_REQ_ORG="Copyleft Certificate Co" \
    EASYRSA_REQ_OU="My Organizational Unit" \
    EASYRSA_REQ_EMAIL="marktalston@gmail.com"
