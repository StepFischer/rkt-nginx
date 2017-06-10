#!/bin/bash

rkt --debug --insecure-options=image run nginx.aci --volume html,kind=host,source=$PWD/test --net=host
# rkt --debug --insecure-options=image run nginx.aci --net=host
