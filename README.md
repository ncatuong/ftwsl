# ftwsl - fedora tweaks for wsl2
> [!NOTE]
> This script enables special tweaks to make Fedora linux more usable out of the box, **_run at your own risk!_**
> This script is fully autonomous, once run via CLI it will install programs and configure Fedora with the tweaks listed below.

## About
This script includes two versions, desktop and laptop. Pick accordingly, laptop includes additional tweaking to the gnome-subsystem that allows for more efficient use of the trackpad. Desktop does not include these tweaks, making for a slightly faster set up process.

## Normal:

|Tweaks included | Description |
| ------------- | ------------- |
| DNF speed up | Sets fastest mirror to true, and DNF to parallel download up to 10 programs simultaneously |
| RPM Fusion |  Installs both free and non-free channels |
| Gnome-tweaks | Default desktop tweaking tool |
| Fedy | All in one configuration tool for Fedora | 
| Steam | Installs latest version from repositories | 
| VLC | An open source all-in-one mutlimedia tool |
| Propriety multimedia codecs | Includes support for libdvdcss, and all compatible free and proprietry firmware drivers from DNF | 
| Better Compression support | Installs p7zip and all related program plugins | 
| Better_fonts| Installs MSCore fonts and Cabextract |
| Snap Support | Installs and enables support for snap packages | 
| Wine | Installs latest Wine-Developer from DNF |
| Fish | A user friendly shell for the 21st century | 
| Audacity | Open source audio-editing tool |
| Chromium | Pure open source version of google chrome |
| SSD Trimmer | Enables Systemd call for fstrim.timer |


## Extra: 

|Tweaks included | Description |
| ------------- | ------------- |
| WIP  | WIP |

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
