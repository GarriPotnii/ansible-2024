# Ansible Role: Enable CPU Performance Mode

## Description

This Ansible role is designed to configure the CPU scaling governor to "performance" mode on a Linux system and disable C-state.

The performance governor minimizes the use of power-saving features, allowing the CPU to run at its maximum frequency and thus improving performance. This role checks if the governor file exists and applies the configuration if it does. 

C-states are power-saving modes for CPUs, and disabling them can be useful for performance tuning or debugging. This role checks if C-states can be modified and then disables them for all processors if possible.

## Requirements

No specific requirements beyond Ansible itself.

## Role Variables

This role does not use any configurable variables.

## Dependencies

This role has no dependencies.
