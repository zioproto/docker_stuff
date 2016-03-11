#!/bin/bash

PUID=${PUID:-1000}
PGID=${PGID:-1000}

if [ ! "$(id -u firefox)" -eq "$PUID" ]; then usermod -o -u "$PUID" firefox ; fi
if [ ! "$(id -g firefox)" -eq "$PGID" ]; then groupmod -o -g "$PGID" firefox ; fi

echo "
-------------------------------------
GID/UID
-------------------------------------
User uid:    $(id -u firefox)
User gid:    $(id -g firefox)
-------------------------------------
"
