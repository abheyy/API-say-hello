# Create .ssh directory if it doesn't exist
$sshDir = "$env:USERPROFILE\.ssh"
if (-not (Test-Path $sshDir)) {
    New-Item -ItemType Directory -Path $sshDir
}

# Create or update the SSH key file
# Check if VM_SSH_KEY environment variable exists
if (-not $env:VM_SSH_KEY) {
    Write-Error "Error: VM_SSH_KEY environment variable is not set. Please set it with your SSH private key."
    exit 1
}

$keyPath = "$sshDir\id_rsa"
$env:VM_SSH_KEY | Out-File -FilePath $keyPath -Encoding ASCII

# Set proper permissions for the SSH key
$acl = Get-Acl $keyPath
$acl.SetAccessRuleProtection($true, $false)
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule($env:USERNAME, "FullControl", "Allow")
$acl.AddAccessRule($rule)
Set-Acl $keyPath $acl

# Test SSH connection
Write-Host "Testing SSH connection..."

# Check if VM_HOST environment variable exists
if (-not $env:VM_HOST) {
    Write-Error "Error: VM_HOST environment variable is not set. Please set it with your VM hostname or IP address."
    exit 1
}

ssh -o StrictHostKeyChecking=no azureuser@$env:VM_HOST "echo 'SSH connection successful!'"