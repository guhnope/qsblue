#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
## Install extra DNF Packages
dnf5 install -y \
 niri xwayland-satellite alacritty greetd greetd-selinux util-linux wlsunset wl-clipboard \
 qt6-wayland tuned whois plymouth xdg-desktop-portal-gnome imv nemo mousepad  

dnf5 -y copr enable avengemedia/danklinux
dnf5 -y copr enable avengemedia/dms

dnf5 install -y quickshell matugen material-symbols-fonts dms dms-greeter

dnf5 -y copr enable ublue-os/packages
dnf5 install -y ublue-brew ublue-os-udev-rules ublue-os-just ublue-os-luks ublue-os-signing

systemctl enable greetd
systemctl enable brew-setup.service
systemctl enable firewalld