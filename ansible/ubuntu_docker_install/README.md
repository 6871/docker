Install latest Docker software on an Ubuntu target machine.

Example use:

```shell script
git clone https://github.com/6871/docker.git
cd docker/ansible/ubuntu_docker_install

# Set these variables for your environment
target_host=                            # Target host IP or name
ssh_user=                               # SSH user Ansible will use
ssh_key=                                # Private key for SSH connection
#ansible_optional='--ask-become-pass'   # Uncomment to request sudo password

ansible-playbook \
  "--inventory=${target_host}," \
  "--user=${ssh_user}" \
  ${ansible_optional} \
  install.yml
```

Set ```apt_upgrade=safe``` to also perform a safe package upgrade:

```shell script
ansible-playbook \
  "--inventory=${target_host}," \
  "--user=${ssh_user}" \
  ${ansible_optional} \
  install.yml \
  --extra-vars apt_upgrade=safe
```
