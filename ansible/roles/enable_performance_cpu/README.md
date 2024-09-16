# Ansible Role: Enable Performance CPU

This Ansible role configures the system to improve CPU performance by disabling C-states and setting the CPU frequency scaling governor to `performance`. The role applies these changes both immediately and ensures they persist across reboots.

## Role Variables

This role does not require any specific variables, but you can customize whether the system should reboot automatically after changes.

- `auto-reboot` (default: `false`): If set to `true`, the system will automatically reboot after applying changes that affect CPU performance.

## Handlers

The role defines the following handlers:

- **Update grub**: Updates the GRUB configuration to apply changes to CPU C-state settings.
- **Reload cpufrequtils**: Reloads the `cpufrequtils` service after modifying the CPU frequency scaling governor.
- **Reboot**: Reboots the system if `auto-reboot: true` is set.

## Tasks

The role performs the following tasks:

1. **Get current C-state**: Retrieves the current CPU C-state using the `cpupower idle-info` command.
2. **Print current C-state**: Outputs the current C-state information to the Ansible console.
3. **Disable C-state in GRUB**: Modifies the `GRUB_CMDLINE_LINUX` configuration to disable CPU C-states by setting `processor.max_cstate=0` and `intel_idle.max_cstate=0`.
4. **Disable C-state now**: Disables C-states immediately using the `cpupower idle-set --disable-by-latency 0` command.
5. **Install cpufrequtils**: Installs the `cpufrequtils` package, which is used to manage CPU frequency settings.
6. **Set governor to performance**: Configures the CPU frequency governor to `performance` mode by updating the `/etc/default/cpufrequtils` file.
7. **Verify CPU governor**: Verifies that the CPU governor has been successfully set to `performance` mode.
8. **Display new CPU governor**: Outputs the new CPU governor information to the Ansible console.

## Usage

To use this role in your playbook, add it as follows:

```yaml
- hosts: all
  roles:
    - enable_performance_cpu
  vars:
    auto-reboot: true  # Optional, default is false
