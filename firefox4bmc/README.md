# firefox4server

This is a docker image containing a firefox browser which is able to connect to BMC Server consoles from a MAC.

## Docker VM

Follow the steps explained in the folder above to build a docker VM. The make sure the VM is running. If not start it with:

    docker-machine start <docker_vm_name>
    
e.g

	docker-machine start default

## XQuartz
	
Make sure XQuartz is running. You can start it from the Launchpad


## Firefox

Start firefox with 

    ./firefox4bmc <server_short_name>
    
e.g.

    ./firefox4bmc zhdk0087

### Start browser manually (without the script)

If the defaults don't fit your needs you can start the brower manually:

Allow connections from the docker VM to XQuartz:

    /opt/X11/bin/xhost +$(docker-machine ip <docker_vm_name>)

e.g

	/opt/X11/bin/xhost +$(docker-machine ip default)

Setup the environment in your shell for the docker utility:

    eval "$(docker-machine env <docker_vm_name>)"
    docker run --rm --net=host -e DISPLAY=192.168.99.1:0.0 schnidrig/firefox4bmc [url]
    
e.g. 

    eval "$(docker-machine env default)"
    docker run --rm --net=host -e DISPLAY=192.168.99.1:0.0 schnidrig/firefox4bmc http://zhdk0087-admin.zhdk.cloud.switch.ch
    
    
Note: the IP 192.168.99.1 should be correct, if you created the docker VM with the script `../create_docker_vm`.


## Build Image

This is not needed unless you wish to change the image. 

    cd build
    eval "$(docker-machine env <docker_vm_name>)"
    docker build --tag=firefox4bmc .
    
run the image

    docker run --name firefox4bmc --net=host -e DISPLAY=192.168.99.1:0.0 firefox4bmc
    
-> Menu: "Edit" -> "Preferences" -> "Content" -> uncheck "Block pop-up windows"

-> Menu: "Edit" -> "Preferences" -> "General" -> set home page accoring to your preferences

    docker commit firefox4bmc

-> this returns a hash: insert that 'image-hash' in the command below

    docker tag -f <image-hash> firefox4bmc
    docker rm firefox4bmc
    

