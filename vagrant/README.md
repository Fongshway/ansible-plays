# Using Vagrant to create and develop Ansible playbooks

Inspired by André Kwakernaak's post [Using Vagrant to create Ansible playbooks](https://blog.andrekwakernaak.xyz/2017-using-vagrant-to-create-ansible-playbooks).

## Setup (from OSX host machine)

### Prerequisites

* Vagrant
* VirtualBox
* Ansible

## Useful commands

The below commands should be run from the directory containing the Vagrantfile.

Make Vagrant create the VM and run the playbook with:
```
$ vagrant up
```

Login to the VM and check the result of your playbook with:
```
$ vagrant ssh
```

Rerun the provisioning system and execute the playbook with:
```
$ vagrant provision
```

Destroy and re-create the VM with:
```
$ vagrant destroy && vagrant up
```

Vagrant also generates an inventory file, which can be used with Ansible directly:
```
$ cd /path/to/repo/plays
$ ansible-playbook linode.yaml --verbose -i ../vagrant/server/.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
```

Use tags to only run a subset of the playbook:
```
$ ansible-playbook linode.yaml --verbose -i ../vagrant/server/.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --tags "aur,taskd"
```
