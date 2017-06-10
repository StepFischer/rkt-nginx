#!/bin/bash

#rkt --debug --insecure-options=image run alpine-armv7l.aci --volume html,kind=host,source=/home/pi/builds/alpine/test --net=host
rkt --debug --insecure-options=image run alpine-armv7l.aci --net=host
