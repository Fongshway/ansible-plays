# Ansible Playbooks

Repo to store [Ansible](http://www.ansible.com/) playbooks used to provision:

1. My Linode VPS running [Arch Linux](https://www.archlinux.org/) from a control machine.
2. My Macbook Pro as a host machine.

Repo structure was inspired by [ansible-best-practises](https://github.com/enginyoyen/ansible-best-practises).

## Prerequisites for control machine

* Python (>= 2.6 or >= 3.5)
* pip
* virtualenv
* git

For more info, see [Control Machine Requirements](https://docs.ansible.com/ansible/latest/intro_installation.html#control-machine-requirements).

## Setup

### On OSX control machine

Clone the repo.

```
$ git clone --recurse-submodules git@bitbucket.org:fongshway/ansible-new.git --recursive --branch master
$ cd ansible
```

Run the bootstrap.sh script and activate the virtualenv.

```
$ bash bootstrap.sh
$ source venv/bin/activate
```

Create .vpass file and add the vault password.

```
$ touch .vpass
```

Create etc/hosts file and modify as needed.

```
$ cp etc/hosts.example etc/hosts
```

## Running playbooks

### On clean Linode Arch Linux build with ansible_user=root

```
$ ansible-playbook linode.yaml -i ../etc/hosts -v --tags "init" --ask-pass
```

### On Linode Arch Linux with ansible_user=non-root-user

```
$ ansible-playbook linode.yaml -i ../etc/hosts -v
$ ansible-playbook linode.yaml -i ../etc/hosts -v --tags "aur,taskd"
```
