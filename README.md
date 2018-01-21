# Fongshway Ansible Files

Repo to document and test use of [Ansible](http://www.ansible.com/) for provisioning my Linode server running [Arch Linux](https://www.archlinux.org/), although this repo may be adapted to provision other machines in the future.

## Setup (from OSX host machine)

### Prerequisites

* Python (>= 2.6 or >= 3.5)
* pip
* virtualenv
* git
* SSH access to this repo

For more info, see [Control Machine Requirements](https://docs.ansible.com/ansible/latest/intro_installation.html#control-machine-requirements)

### Installation instructions

Clone the repo.

```
$ cd ~/git
$ git clone --recurse-submodules git@bitbucket.org:fongshway/ansible.git --recursive --branch master
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

## Setup (As Local Root on Linode)

Connect to Linode server as root and update the system.

```
# ssh root@104.237.150.230 # <-- on local machine
# pacman -Syu              # <-- on remote machine
```

Install git and ansible.  Then clone this repository from bitbucket.

```
# pacman -S ansible git vim
# git clone --recurse-submodules https://fongshway@bitbucket.org/fongshway/ansible.git ~/ansible --branch master
```

Replace the default files in `/etc/ansible/hosts` and `/etc/ansible/ansible.cfg` with the versions from this repository.

```
# ln -si ~/ansible/etc/hosts /etc/ansible/hosts
# ln -si ~/ansible/etc/ansible.cfg /etc/ansible/ansible.cfg
```

Run the provision playblook.

```
# cd ~/ansible
# ansible-playbook provision-arch-server.yaml
```

## Resources

- Tutorials
    - [Servers for Hackers: An Ansible Tutorial](https://serversforhackers.com/an-ansible-tutorial)
- Example roles
    - [Ansible Galaxy: init_system](https://galaxy.ansible.com/detail#/role/4492)
    - [Servers for Hackers: ansible-infrastructure](https://github.com/Servers-for-Hackers/ansible-infrastructure)
    - [ArchLinux AUR role](https://github.com/jtyr/ansible-archlinux_aur)

## To-Do

- Add bootstrap script
- Install AUR packages automatically using aur role (which is currently not working)
    - cower
    - pacaur
    - dropbox dropbox-cli
    - buku
    - pass
- Automate git clones
    - Have dotfiles cloned directly into kfong home directory using Ansible git module
    - Automatically install vundle `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
    - zsh-autosuggestions oh-my-zsh plugin `git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions`
- Automate install of oh-my-zsh for kfong user https://github.com/robbyrussell/oh-my-zsh
- Add task to set up symbolic link for Taskwarrior setup `ln -s ~/Dropbox/Scripts/.task .task`
- Change ssh port from 22 to something else.    
- **[done]** Figure out way to install python easy_install (see if using pacman to install python setuptools installs easy_install)
- **[done]** Check that python modules install correctly (e.g. pip and virtualenv) and see for which version of python they are installed for
- **[done]** Check if sshd daemon actually restarted (e.g. see if root login is possible after running playbook)
