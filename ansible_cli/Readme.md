# Ansible

This image allows for seemless ansible integration into your mac os x shell.

## Setup

define following alias in your shell:

	alias ansible-playbook="docker run -ti --net=host -v ~/.ssh:/home/docker/.ssh -v `pwd`:/workdir --rm schnidrig/ansible_cli:1.9 ansible-playbook"
	
then you can call a playbook like this:

	ansible-playbook -i <myInventory> <myPlaybook>

Note: make sure all files needed by ansible-playbook are in or below the current directory.


## Build Image

This is not needed unless you wish to change the image. 

    cd build
    docker build -t ansible_cli.

now you can use the image. 

If you have a dockerhub account you can push it with: (e.g. to account "schnidrig")
    
    docker tag -f ansible schnidrig/ansible_cli:<version> .
    docker push schnidrig/ansible_cli:<version>

	