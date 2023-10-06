#!/bin/bash

ssh -o BatchMode=yes -o ConnectTimeout=5 ubuntu@node01 echo ok
if [ $? -eq 0 ] ; then
    exit 0
else
    exit 1
fi
