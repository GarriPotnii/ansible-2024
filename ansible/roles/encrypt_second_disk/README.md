# Ansible Role: Encrypt Disk with LUKS

## Description

This Ansible role performs encryption of a specified disk using LUKS (Linux Unified Key Setup). It ensures that the disk exists, encrypts it, opens the encrypted disk, and verifies that the encryption has been applied correctly.

## Requirements

- `cryptsetup` for disk encryption.
- The `ls` command to check the existence of the encrypted disk.

## Role Variables

This role uses the following variables:

- `disk_name`: The name of the disk to be encrypted (e.g., `/dev/sdb`).
- `luks_password`: The password for LUKS encryption.
