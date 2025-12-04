#!/bin/bash
set -euo pipefail

# Create the alternatives symlinks that Fedora’s update-alternatives expects
update-alternatives --install /usr/bin/vi   vi   /usr/bin/nvim 100
update-alternatives --install /usr/bin/vim  vim  /usr/bin/nvim 100
update-alternatives --install /usr/bin/view view /usr/bin/nvim 100
update-alternatives --install /usr/bin/vimdiff vimdiff /usr/bin/nvim 100

# Also make the traditional /etc/alternatives links (some tools still look there)
ln -sf /usr/bin/nvim /etc/alternatives/vi
ln -sf /usr/bin/nvim /etc/alternatives/vim
ln -sf /usr/bin/nvim /etc/alternatives/view
ln -sf /usr/bin/nvim /etc/alternatives/vimdiff

# Optional: make the raw /usr/bin symlinks too (harmless and makes muscle memory happy)
ln -sf /usr/bin/nvim /usr/bin/vi
ln -sf /usr/bin/nvim /usr/bin/vim
ln -sf /usr/bin/nvim /usr/bin/view
ln -sf /usr/bin/nvim /usr/bin/vimdiff