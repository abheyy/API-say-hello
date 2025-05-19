#!/bin/bash

# Create .ssh directory if it doesn't exist
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Create or update the SSH key file
# Check if VM_SSH_KEY environment variable exists
if [ -z "$VM_SSH_KEY" ]; then
    echo "Error: VM_SSH_KEY environment variable is not set. Please set it with your SSH private key."
    exit 1
fi

# Write the SSH key from environment variable
echo "$VM_SSH_KEY" > ~/.ssh/id_rsa

# Set proper permissions for the SSH key
chmod 600 ~/.ssh/id_rsa

# Test SSH connection
echo "Testing SSH connection..."

# Check if VM_HOST environment variable exists
if [ -z "$VM_HOST" ]; then
    echo "Error: VM_HOST environment variable is not set. Please set it with your VM hostname or IP address."
    exit 1
fi

ssh -o StrictHostKeyChecking=no azureuser@$VM_HOST "echo 'SSH connection successful!'"