# Ansible Role: Encrypt Partition

This Ansible role is designed to encrypt a specific partition on a system using LUKS (Linux Unified Key Setup) encryption. It automates the process of installing the necessary tools, checking the partition, and applying encryption.

## Requirements

This role requires the following Ansible collection to be installed:

```bash
ansible-galaxy collection install community.crypto

## Role Variables

You can configure the following variables to customize the behavior of this role:

| Variable                          | Default Value              | Description |
| ---------------------------------- | -------------------------- | ----------- |
| `encrypt_partition_luks_password`  | `default_secure_password`   | The password to encrypt the partition. You should override this with a secure passphrase. |
| `encrypt_partition_partition_name` | `""`                       | The full path to the partition you want to encrypt (e.g., `/dev/sda1`). This must be set before running the role. |

## Tasks

The role performs the following tasks:

1. **Check if the partition exists**: Verifies whether the specified partition exists at `{{ encrypt_partition_partition_name }}`.
2. **Fail if the partition does not exist**: Stops execution if the partition does not exist, providing an error message.
3. **Install cryptsetup**: Installs the `cryptsetup` package, which is required for managing LUKS encryption on the partition.
4. **Open the LUKS container**: Creates and opens a LUKS container on the specified partition using the passphrase provided in `encrypt_partition_luks_password`.
5. **Fail if LUKS container fails to open**: Fails the play if the partition cannot be encrypted or opened successfully.

## Usage

To use this role in your playbook, specify the target partition and encryption passphrase in your playbook or inventory:

```yaml
- hosts: all
  roles:
    - encrypt_partition
  vars:
    encrypt_partition_partition_name: "/dev/sda1"
    encrypt_partition_luks_password: "your_secure_password"
