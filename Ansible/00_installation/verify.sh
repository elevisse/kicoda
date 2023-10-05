#!/bin/bash

ansible --version > check.txt
if [ ! -s "check.txt" ]; then
    exit 1
else
    exit 0
fi
