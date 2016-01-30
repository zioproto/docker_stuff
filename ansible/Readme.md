# Ansible

Docker image based on ubuntu with ansible installed.

## Build Image

This is not needed unless you wish to change the image. 

    cd build
    docker build -f Dockerfile-<version> -t ansible:<version> .
 
 e.g.:   
 
    docker build -f Dockerfile-1.9 -t ansible:14.04-1.9 .

now you can use the image. 

If you have a dockerhub account you can push it with: (e.g. to account "schnidrig")
    
    docker tag -f ansible schnidrig/ansible:<version> .
    docker push schnidrig/ansible:<version>

	