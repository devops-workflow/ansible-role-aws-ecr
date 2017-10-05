
export ANSIBLE_ROLES_PATH=$(pwd)/roles:${ANSIBLE_ROLES_PATH}
#/etc/ansible/roles

# Setup and run role
ansible-galaxy install -f -r requirements.yml
### Test: syntax
ansible-playbook -i inventory test.yml --syntax-check
ansible-playbook -i inventory test.yml --extra-vars aws_region=us-west-2
