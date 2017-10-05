
export ANSIBLE_ROLES_PATH=$(pwd)/roles:${ANSIBLE_ROLES_PATH}
#/etc/ansible/roles

env | sort
echo "Installing roles..."
ansible-galaxy install -f -r requirements.yml
### Test: syntax
echo "Test: syntax"
ansible-playbook -i inventory test.yml --syntax-check
echo "Run test playbook"
ansible-playbook -i inventory test.yml --extra-vars aws_region=us-west-2
