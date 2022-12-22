#!/bin/sh
ansible-playbook provisioning-project-dso.yml -i inventory/ -e "ORGANIZATION_NAME=interieur" -e "EMAIL=test@test.com" -e "PROJECT_NAME=inittest" --connection=local -e 'ansible_python_interpreter=/usr/bin/python3' -vvv
