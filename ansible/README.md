# Ansible Playbook: System Configuration and Optimization

This Ansible playbook performs various system tasks, including encrypting partitions, renaming network interfaces, and improving CPU performance. It is designed to automate key configurations for systems requiring enhanced security and performance.

## Playbook Structure

### 1. Encrypt the Second Disk in the System

This playbook encrypts the second disk found on the target system using the `encrypt_partition` role.

- **Hosts**: All
- **Tags**: `encrypt`
- **Role**: `encrypt_partition`
- **Pre-tasks**:
  - Sets the disk name based on the `encrypt_disk_name` variable.
  - The disk is encrypted with LUKS, and the encryption passphrase is configurable.

### 2. Encrypt Partition Next to Root

This playbook locates the partition next to the root filesystem and encrypts it.

- **Hosts**: All
- **Tags**: `encrypt`
- **Role**: `encrypt_partition`
- **Pre-tasks**:
  - Gathers block device information using `lsblk`.
  - Identifies the root filesystem device and the partition next to it.
  - The identified partition is encrypted using LUKS.

### 3. Rename Network Interfaces

This playbook renames the active network interface using the `network_interface_rename` role.

- **Hosts**: All
- **Tags**: `network`
- **Role**: `network_interface_rename`
- **Description**:
  - Renames the active network interface according to the defined configuration in `network_interface_rename_new_interface_name`.

### 4. CPU Performance Improvements

This playbook applies CPU performance optimizations using the `enable_performance_cpu` role.

- **Hosts**: All
- **Tags**: `performance`
- **Role**: `enable_performance_cpu`
- **Description**:
  - Disables CPU C-states to prevent power-saving features from reducing performance.
  - Sets the CPU frequency governor to `performance` mode.

### 5. Print CPU Info

This playbook gathers and displays CPU information, including details on whether Hyper-Threading is enabled.

- **Hosts**: All
- **Tags**: `cpu_info`
- **Tasks**:
  - Retrieves detailed CPU information using the `lscpu` command.
  - Displays Hyper-Threading status based on the number of threads per core.

## How to Run the Playbook

You can run this playbook with specific tags to execute only certain sections. For example:

- To encrypt disks, use:
  ```bash
  ansible-playbook playbook.yml --tags encrypt
