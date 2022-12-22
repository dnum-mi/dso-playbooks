from ubuntu:22.04

RUN mkdir /dso

COPY inventory /dso/inventory/
COPY roles /dso/roles/
COPY *.yml /dso/
RUN apt update
RUN apt install -y python3 build-essential python3-dev libldap2-dev libsasl2-dev python3-pip curl
COPY *.sh /dso/



RUN pip3 install hvac
RUN pip3 install python-gitlab
ENV PATH="$PATH:/root/.local/bin"

RUN pip3 install python-ldap kubernetes
RUN python3 -m pip install --user ansible 
RUN ansible-galaxy collection install community.hashi_vault kubernetes.core
