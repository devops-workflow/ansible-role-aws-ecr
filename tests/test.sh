
# Setup and run role
ansible-galaxy install -r requirements.yml
ansible-playbook -i inventory test.yml
