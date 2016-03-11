#!/bin/bash

/fixUser.sh
exec sudo -u firefox /usr/bin/firefox "$@"
