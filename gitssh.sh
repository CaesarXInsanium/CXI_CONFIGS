#! /bin/env sh
echo "Input Email"
read EMAIL
echo "Generating Key"
ssh-keygen -t ed25519 -C  "$EMAIL"
eval "(ssh-agent -s)"
ssh-add ~/.ssh/*

