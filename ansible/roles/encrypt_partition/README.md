# Ansible Role: Encrypt Disk with LUKS

## Description

This Ansible role performs encryption of a specified disk using LUKS (Linux Unified Key Setup). It ensures that the disk exists, encrypts it, opens the encrypted disk, and verifies that the encryption has been applied correctly.

## Requirements

- `cryptsetup` for disk encryption. (Installs by role)
- `community.crypto.luks_device module` You might already have this collection installed if you are using the `ansible` package.

## Role Variables

This role uses the following variables:

- `encrypt_partition_partition_name`: The name of the disk to be encrypted (e.g., `/dev/sdb`).
- `encrypt_partition_luks_password`: The password for LUKS encryption.
