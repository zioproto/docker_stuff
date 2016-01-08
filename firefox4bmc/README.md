# firefox4server

This is a docker image containing a firefox browser which is able to connect to BMC Server consoles from a MAC.

## Build Image
This is not needed unless you wish to change the image. Instead of building the image youself, you may simply use schnidrig/firefox4bmc

    cd build
    eval "$(docker-machine env <docker_vm_name>)"
    docker build --tag=firefox4bmc .
    
run the image

    docker run --name firefox4bmc --net=host -e DISPLAY=192.168.99.1:0.0 firefox4bmc
    
-> Menu: "Edit" -> "Preferences" -> "Content" -> uncheck "Block pop-up windows"
-> Menu: "Edit" -> "Preferences" -> "General" -> set home page accoring to your preferences

    docker commit firefox4bmc

-> this return a hash -> save that 'image-hash'

    docker tag -f <image-hash> firefox4bmc
    docker rm firefox4bmc
    

## run browser

Make sure XQuartz is running.

Make sure the docker VM is running. If not start it with:

    docker-machine start <<docker_vm_name>>

Allow connections from the docker VM to XQuartz:

    /opt/X11/bin/xhost +$(docker-machine ip <docker_vm_name>)

Start the browser with: 

    eval "$(docker-machine env <docker_vm_name>)"
    docker run --rm --net=host -e DISPLAY=192.168.99.1:0.0 schnidrig/firefox4bmc [url]
    
e.g. 

    eval "$(docker-machine env <docker_vm_name>)"
    docker run --rm --net=host -e DISPLAY=192.168.99.1:0.0 schnidrig/firefox4bmc http://zhdk0087-admin.zhdk.cloud.switch.ch
    
or use the script firefox4bmc:

    firefox4bmc <server_short_name>
    
e.g.

    firefox4bmc zhdk0087
    
Note: the IP 192.168.99.1 should be correct, if you created the docker VM with the script `../create_docker_vm`.

