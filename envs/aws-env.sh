#!/bin/bash
#Sets variables from the DO_NOT_COMMIT.env file to shell env variables.
set -a
source setup.env
set +a

#Prints confirmation:
echo "AWS CLI environment is set up for this session"
