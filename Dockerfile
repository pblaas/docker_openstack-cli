FROM alpine:3.6

MAINTAINER Patrick Blaas <patrick@kite4fun.nl>

ARG TERRAFORM_VERSION=0.9.11

env OS_AUTH_URL="https://identity.openstack.cloudvps.com/v3"
env OS_PROJECT_ID=""
env OS_TENANT_ID=""
env OS_PROJECT_NAME=""
env OS_TENANT_NAME=""
env OS_USER_DOMAIN_NAME="Default"
env OS_USERNAME=""
env OS_PASSWORD=""
env OS_REGION_NAME="AMS"
env OS_INTERFACE=public
env OS_IDENTITY_API_VERSION=3

RUN apk add --no-cache --update \
  bash \
  git \
  curl \
  openssh-client \
  openssl \
  python-dev \
  py-pip \
  py-setuptools \
  ca-certificates \
  gcc \
  musl-dev \
  linux-headers \
  && pip install --upgrade --no-cache-dir pip setuptools python-openstackclient python-heatclient python-neutronclient \
  && apk del gcc musl-dev linux-headers \
  && rm -rf /var/cache/apk/*


RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
  && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

VOLUME ["/blueprints"]
WORKDIR /blueprints

COPY run.sh /usr/local/bin/run.sh

ENTRYPOINT ["/usr/local/bin/run.sh"] 

