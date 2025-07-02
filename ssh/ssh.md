# SSH Key Management Guide

## Overview
This guide provides step-by-step instructions for setting up project-specific SSH keys for secure Git operations. Using project-specific keys enhances security by isolating access credentials for different repositories.

## Prerequisites
- Git installed on your system
- Access to terminal/command line
- GitHub account with repository access

## Setup Process

### 🔑 1. Generate Project-Specific SSH Key
Create a unique SSH key pair for your project:
```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/project_name
```
**Note:** Replace `project_name` with your actual project identifier.

### 🚀 2. Start the SSH Agent
Initialize the SSH agent to manage your keys:
```bash
eval "$(ssh-agent -s)"
```

### ➕ 3. Add Your New SSH Key to the Agent
Register your private key with the SSH agent:
```bash
ssh-add ~/.ssh/project_name
```

### 📋 4. Copy the SSH Key to Clipboard
Retrieve your public key for GitHub configuration:
```bash
cat ~/.ssh/project_name.pub
```
**Action Required:** Copy the output and add it to your GitHub account's SSH keys.

### ⚙️ 5. Edit the SSH Config File
Open the SSH configuration file:
```bash
nano ~/.ssh/config
```

### 🏠 6. Add a New Host Configuration
Add the following configuration block:
```
Host project_name.github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/project_name
```
**Purpose:** This creates a custom hostname that automatically uses your project-specific key.

### 📥 7. Clone Your Repository Using the Configured Host
Clone your repository with the custom host:
```bash
git clone --branch main --single-branch git@project_name.github.com:your_username/your_project.git
```
**Note:** Replace `your_username` and `your_project` with actual values.

### ✅ 8. Test the SSH Connection
Verify your SSH setup is working correctly:
```bash
ssh -T git@project_name.github.com
```
**Expected Output:** A success message from GitHub confirming authentication.

## Security Benefits

- **Isolation**: Each project uses its own SSH key
- **Access Control**: Revoke access per project without affecting others
- **Audit Trail**: Track which keys are used for which projects
- **Reduced Risk**: Compromise of one key doesn't affect all projects

## Troubleshooting

### Common Issues:
1. **Permission denied**: Ensure the SSH key is added to GitHub
2. **Agent not running**: Restart the SSH agent
3. **Wrong key used**: Check SSH config file syntax
4. **File permissions**: Ensure SSH files have correct permissions (600 for private keys)

### Verification Commands:
```bash
# List loaded SSH keys
ssh-add -l

# Test specific key
ssh -T -i ~/.ssh/project_name git@github.com

# Debug SSH connection
ssh -vT git@project_name.github.com
```

## Best Practices

- Use descriptive names for SSH keys
- Regularly rotate SSH keys
- Keep private keys secure and never share them
- Use strong passphrases for SSH keys
- Document your SSH configurations

---
*Last updated: [Current Date]*

        