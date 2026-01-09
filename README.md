# ftwsl - fedora tweaks for wsl2
> [!NOTE]
> This script enables special tweaks to make Fedora linux more usable out of the box, **_run at your own risk!_**
> This script is fully autonomous, once run via CLI it will install programs and configure Fedora with the tweaks listed below.

## About
This script includes two versions, desktop and laptop. Pick accordingly, laptop includes additional tweaking to the gnome-subsystem that allows for more efficient use of the trackpad. Desktop does not include these tweaks, making for a slightly faster set up process.

## Features:

|Tweaks included | Description |
| ------------- | ------------- |
| DNF speed up | Sets fastest mirror to true, and DNF to parallel download up to 10 programs simultaneously |
| RPM Fusion |  Installs both free and non-free channels |

**And more to come in the future!**

___

# Installation Procedure:
***Must be run in Bash or other POSIX compatible shell! If you dont know what that means, you're probably already in Bash.***

### Desktop Version

```
git clone https://github.com/ncatuong/ftwsl.git ftwsl # Clone repository
cd ~/ftwsl/ # Change directory to the repository folder
sudo bash ftwsl.sh # Run file with superuser permission
```
