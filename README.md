# NixOS Configuration

A personal NixOS configuration flake for reproducible system setup and management.

## 🚀 Quick Start

### Installation

1. **Clone the repository** to any location you prefer:
   ```bash
   git clone <your-repo-url>
   cd <cloned-directory>
   ```

2. **Apply the configuration** using nixos-rebuild:
   ```bash
   sudo nixos-rebuild switch --flake "<cloned-dir>"
   ```

   Replace `<cloned-dir>` with the actual path where you cloned the repository.

## ⚠️ Important Notice

**Neovim Configuration Warning**: This configuration uses [nvf](https://github.com/notashelf/nvf) (Neovim Flake) within home-manager for Neovim setup. Please note that nvf doesn't support all well-known plugins, so use at your own risk. You may need to modify the Neovim configuration to suit your specific plugin requirements.

## 📁 Structure

```
.
├── flake.nix           # Main flake configuration
├── flake.lock          # Locked dependencies
├── configuration.nix   # System configuration
├── nvf-conf.nix        #nvf config file,run with nix run "cloned-dir"
├── home.nix           # Home-manager configuration
└── README.md          # This file
```

## 🔧 Customization

Before applying this configuration:

1. Review `configuration.nix` for system-level settings
2. Check `home.nix` for user-specific configurations
3. Modify hardware configuration as needed
4. Adjust the nvf Neovim setup in home-manager if you need specific plugins

## 🔄 Updating

To update your system with the latest changes:

```bash
cd <cloned-dir>
git pull
sudo nixos-rebuild switch --flake "."
```

## 📋 Requirements

- NixOS with flakes enabled
- Git for cloning the repository
- Sudo privileges for system rebuilds

## 🤝 Contributing

Feel free to open issues or submit pull requests if you have suggestions for improvements.

## 📄 License

This configuration is provided as-is for personal use. Modify according to your needs.
