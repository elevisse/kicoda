#!/bin/bash

ansible --version > check.txt
if grep -q "not found" check.txt; then
    exit 1
else
    exit 0
fi
