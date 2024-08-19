# Ansible Role: Encrypt Root Disk Partition with LUKS

## Description

This Ansible role identifies the root disk and an available partition on it, then encrypts the partition using LUKS (Linux Unified Key Setup). It includes steps to determine the root disk, find an available partition, and perform encryption operations.

## Requirements

- `cryptsetup` for disk encryption.
- Basic shell commands like `lsblk`, `grep`, and `awk`.

## Role Variables

This role uses the following variables:

- `luks_password`: The password for LUKS encryption.
