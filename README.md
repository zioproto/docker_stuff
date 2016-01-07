# Docker Stuff

This repository holds some scripts used at switch all related to docker on MAC OS X.


## Prerequisits

All scripts assume, that your desktop is a MAC and has homebrew (http://brew.sh/) installed.

Then add Cask tap:

    brew tap caskroom/cask



## Install all docker related software

install DockerToolbox with

    brew install Caskroom/cask/dockertoolbox
    
This will also install virtualbox if you don't have it already.

GUI docker images require an XServer:

    brew install Caskroom/cask/xquartz

Docker running in the VMs cannot access the XQuartz socket. Therefore, XQuartz needs to be configured to allow for network clients to connect:

-> run XQuartz
-> Menu: "XQuartz" -> "Preferences..." -> "Security" tab -> check "Allow connections from network clients"
-> restart xQuartz


## setup a boot2docker VM with docker-machine

Read `setup.default`. If you wish to change the defaults, copy the file to `setup` and edit it according to your needs.

Run the following script which will create the docker virtualbox VM. The standard VM build by docker-machine is not good enough, since at SWITCH we need IPv6 support from the docker VM.

    create_docker_vm

    
## docker images

  * firefox4bmc: image containing a firefox browser which is able to connect to BMC Server consoles