# Docker Stuff

This repository holds some docker related scripts used at SWITCH.
They are intended to be run on MAC OS X.


## Prerequisits

If you want to use the installation scripts below you will need to have homebrew (http://brew.sh/) installed.
After installing homebrew you need to add the Cask tap:

    brew tap caskroom/cask

Of course, you may choose to install the software manually instead. 


## Install Docker Related Software

If you have virtualbox already installed and you installed it by some other means than homebrew,
you may prefere to install docker toolbox manually. You can get it from https://www.docker.com/docker-toolbox.

If you don't have Virtualbox installed or don't mind it being reinstalled, then you may install DockerToolbox together with Virtualbox with this command:

    brew cask install dockertoolbox
    

GUI docker images require an XServer: install it with:

    brew cask install xquartz

Docker running in a VM cannot access the XQuartz socket. Therefore, XQuartz needs to be configured to allow for network clients to connect:

-> run XQuartz

-> Menu: "XQuartz" -> "Preferences..." -> "Security" tab -> check "Allow connections from network clients"

-> restart XQuartz


## Setup Docker VM with docker-machine

Read `setup.default`. If you wish to change the defaults, copy the file to `setup` and edit it according to your needs.

If you happen to have a docker VM (named default) already, either specify a different name in `setup` (variable DOCKER_VM_NAME) or delete your old docker VM with:

    docker-machine stop default
    docker-machine rm default
    
Run the following script which will create the docker virtualbox VM. The standard VM build by docker-machine is not good enough, since at SWITCH we need IPv6 support within the docker VM.

    ./create_docker_vm

    
## Docker Images in this repo

  * firefox4bmc: image containing a firefox browser which is able to connect to BMC Server consoles.
  * oscli: openstack cli

## Hints & Tricks

Instead of having to type `eval "$(docker-machine env <docker_vm_name>)"` in every shell. You may want to define the following shell function:

	function docker() {
		if [ -z "$DOCKER_MACHINE_NAME" ]; then
			eval "$(docker-machine env default)";
		fi
		/usr/local/bin/docker "$@";
	}
