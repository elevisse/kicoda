#!/bin/bash

status=$(ssh -o BatchMode=yes -o ConnectTimeout=5 ubuntu@node01 echo ok 2>&1)
if [[ $status == "ok" ]] ; then
    exit 0
else
    exit 1
fi
