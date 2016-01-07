# Docker Stuff

This repository holds some docker related scripts used at SWITCH.
They are intended to be run on MAC OS X.


## Prerequisits

All scripts assume, that your desktop is a MAC and has homebrew (http://brew.sh/) installed.

Then add Cask tap:

    brew tap caskroom/cask



## Install Docker Related Software

Install DockerToolbox with

    brew install Caskroom/cask/dockertoolbox
    
This will also install virtualbox if you don't have it already.

GUI docker images require an XServer:

    brew install Caskroom/cask/xquartz

Docker running in a VM cannot access the XQuartz socket. Therefore, XQuartz needs to be configured to allow for network clients to connect:

-> run XQuartz


-> Menu: "XQuartz" -> "Preferences..." -> "Security" tab -> check "Allow connections from network clients"

-> restart xQuartz


## Setup a boot2docker VM with docker-machine

Read `setup.default`. If you wish to change the defaults, copy the file to `setup` and edit it according to your needs.

Run the following script which will create the docker virtualbox VM. The standard VM build by docker-machine is not good enough, since at SWITCH we need IPv6 support from the docker VM.

    ./create_docker_vm

    
## Docker Images in this repo

  * firefox4bmc: image containing a firefox browser which is able to connect to BMC Server consoles.