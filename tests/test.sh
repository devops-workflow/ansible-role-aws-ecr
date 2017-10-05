
ANSIBLE_ROLES_PATH=$(pwd)/roles:${ANSIBLE_ROLES_PATH}
#/etc/ansible/roles

# Setup and run role
ansible-galaxy install -r requirements.yml
ansible-playbook -i inventory test.yml
