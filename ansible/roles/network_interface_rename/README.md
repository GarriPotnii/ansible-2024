# Ansible Role: Network Interface Rename

This Ansible role renames a system's primary network interface using `netplan`. It is useful for standardizing network interface names across systems or adhering to naming conventions.

## Role Variables

The following variables can be set to customize the behavior of the role:

| Variable                                 | Default Value                          | Description |
| ---------------------------------------- | -------------------------------------- | ----------- |
| `network_interface_rename_netplan_config` | `/etc/netplan/50-cloud-init.yaml`      | The path to the `netplan` configuration file that needs to be modified to rename the interface. |
| `network_interface_rename_new_interface_name` | `net0`                              | The new name for the active network interface. |

## Tasks

The role performs the following tasks:

1. **Get the current active network interface**: Captures the current network interface in use, typically the one assigned an IPv4 address.
2. **Display current interface information**: Outputs details of the current interface.
3. **Check if the current interface is already renamed**: Skips renaming if the active network interface already matches the desired name.
4. **Rename the network interface**:
   - Checks for the existence of the specified `netplan` configuration file.
   - Updates the `netplan` configuration with the new interface name.
   - Applies the new `netplan` configuration to effect the interface rename.
   - Verifies that the renaming was successful by checking the default route and parsing the interface name.
5. **Display renamed interface**: Displays the new name of the network interface to confirm the change.

## Usage

To use this role in your playbook, specify the desired interface name and the path to the `netplan` configuration file:

```yaml
- hosts: all
  roles:
    - network_interface_rename
  vars:
    network_interface_rename_new_interface_name: "eth0"
    network_interface_rename_netplan_config: "/etc/netplan/01-netcfg.yaml"
