# Ansible Role: Network Interface Renaming with Netplan

## Overview

This Ansible role is designed to manage the renaming of network interfaces on systems that use `netplan` for network configuration. The role performs the following tasks:

1. Identifies the currently active network interface.
2. Updates the `netplan` configuration to rename the network interface.
3. Applies the new `netplan` configuration.
4. Verifies that the network interface has been renamed successfully.

## Role Variables

- `new_interface_name`: The new name for the network interface.
- `netplan_config_path`: The path to the `netplan` configuration file (e.g., `/etc/netplan/01-netcfg.yaml`).
