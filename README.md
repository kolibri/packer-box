Packer template
===============

This template provides a minimal configuration for a vagrant box using the virtualbox provider.

Run with 

	packer build template.json



What is actually installed for this box
---------------------------------------

- Ubuntu 12.04
- VirtualBox Gueast additions
- Vagrant authorized keys file
- No password for `sudo`for the `vagrant` user

What may be installed later
---------------------------

- Puppet 3

