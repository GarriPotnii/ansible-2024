# Ansible Project: System Optimization and Disk Encryption

## Overview

This Ansible project provides a set of roles designed for system optimization and disk encryption. The roles included in this project help you:

- **Disable CPU C-States**: Manage and disable C-states on CPUs to potentially enhance system performance.
- **Display CPU Information**: Display detailed information about the system's CPUs and check if Hyper-Threading is enabled.
- **Enable CPU Performance Mode**: Configure CPUs to operate in performance mode, bypassing energy-saving states.
- **Encrypt Second Disk**: Encrypt disks using LUKS (Linux Unified Key Setup) to secure data.
- **Rename Network Interface**: Rename active network interface by netplan
- **Encrypt Near Root Partition**: Encrypt partiotion near root partition, using LUKS (Linux Unified Key Setup) to secure data.

## Roles

### 1. **Disable C-States**
Disables CPU C-states to prevent the CPU from entering lower power states, which might improve system performance.

**Key Tasks:**
- Check if C-state files are present.
- Disable C-states for all CPUs.

### 2. **Display CPU Information**
Displays detailed information about the system's CPUs and checks if Hyper-Threading is enabled.

**Key Tasks:**
- Display list of CPUs.
- Show CPU information using `lscpu`.
- Check and display Hyper-Threading status.

### 3. **Enable Performance Mode**
Configures the CPU to run in performance mode by setting the appropriate governor.

**Key Tasks:**
- Check if the CPU governor file exists.
- Set CPU governor to performance.

### 4. **Encrypt Second Disk with LUKS**
Encrypts second disk  using LUKS and manages the encryption lifecycle.

**Key Tasks:**
- Verify the existence of the disk.
- Encrypt and open the disk.
- Manage encrypted disk and handle errors.

### 5. **Encrypt Partition with LUKS**

**Key Tasks:**
- Verify the existence of partition.
- Encrypt and open the partition.
- Manage encrypted partitions and handle errors

### 6. **Rename Network Interfaces**
- Get the current active network interface
- Set the active network interface name
- Check if the current interface name is already
- Check if netplan configuration file exists
- Update netplan configuration with new interface name using sed
- Apply netplan configuration
- Check if the network interface was successfully renamed
- Display the renamed network interface name

## Requirements

- Ansible (version 2.9 or higher recommended).
- `cryptsetup` for disk encryption.
- Basic shell commands (`lsblk`, `grep`, `awk`, `sed`, `LUKS`) for disk and partition management.

## Usage

To use the roles in your Ansible playbooks, include the roles in your playbook file and configure the necessary variables. For example:

```yaml
  hosts: all

  roles:
    - encrypt_second_disk
    - encrypt_near_root_part
    - disable_c_state
    - enable_performance_cpu
    - network_interface_rename
    - display_cpu_ht
