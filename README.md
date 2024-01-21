# server-scripts
 my server scripts


### DIRECTORY TREE
project_server-setup
```
server-scripts/
│
|—— config/        # Configuration Templtes, Account Secrets, and related resources.
│   ├── secrets.sh
│   ├── template_.zshrc
│   ├── template_install-module.sh
│   └── ...
│
|—— homelab/        # Contains scripts specific to a homelab server setup like Raspberry Pi or Proxmox
│   ├── dev_new-server-setup.sh
│   # ├── RaspberryPi-setup_debian-bookworm.sh
│   # ├── RaspberryPi-setup_ubuntu-server.sh
│   # ├── RaspberryPi-setup_raspbian-desktop.sh
│   # ├── ProxmoxVE-setup_lxc.sh
│   # ├── ProxmoxVE-setup_vm.sh
│   └── ...
│
├── modules/       # Contains individual installation modules as scripts
│   ├── adduser_oldsoul+io.sh   # Add a backup user and backup-to-the-backup user
│   ├── install_1password.sh
│   ├── install_fail2ban.sh
│   ├── install_sudo.sh
│   ├── install_systemd-resolved.sh
│   ├── install_tailscale.sh
│   ├── install_ufw.sh
│   ├── install_yai.sh
│   ├── install_zsh.sh
│   └── ...
│
└── utils/         # Contains utility scripts like checks and error handling
    ├── checks.sh
    ├── error_handling.sh
    └── env_vars.sh
```