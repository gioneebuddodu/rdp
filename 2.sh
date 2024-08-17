#!/bin/bash

# Remove old files and suppress output
rm -rf ngrok ngrok.zip ngrok.sh > /dev/null 2>&1

echo "======================="
echo "Download ngrok"
echo "======================="

# Download the ngrok tarball
wget -O ngrok-v3-stable-linux-amd64.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Failed to download ngrok."
    exit 1
fi

# Extract the tarball
sudo tar xvzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Failed to extract ngrok."
    exit 1
fi

# Clean up downloaded tarball
rm -f ngrok-v3-stable-linux-amd64.tgz

# Request authtoken
read -p "Paste Ngrok Authtoken: " CRP

# Configure ngrok with the authtoken
ngrok authtoken $CRP
if [ $? -ne 0 ]; then
    echo "Failed to set ngrok authtoken."
    exit 1
fi

echo "Ngrok setup complete."
