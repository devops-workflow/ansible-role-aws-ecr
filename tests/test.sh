
export ANSIBLE_ROLES_PATH=$(pwd)/roles:/etc/ansible/roles
python=$(which python)

env | sort | grep -v ^LESS_TERMCAP

echo -e "\nInstall: pip modules..."
pip install -r requirements.txt

echo -e "\nVersions"
ansible --version
docker --version

echo -e "\nInstall: Ansible roles..."
ansible-galaxy install -f -r requirements.yml

### Test: syntax
echo "Test: syntax"
ansible-playbook -i inventory test.yml --syntax-check --list-tasks
echo "Test: Lint"
ansible-lint -x ANSIBLE0012,ANSIBLE0013 test.yml
echo "Run test playbook"
ansible-playbook -i inventory test.yml --extra-vars ansible_python_interpreter=${python} --extra-vars aws_region=us-west-2 -vvvv
