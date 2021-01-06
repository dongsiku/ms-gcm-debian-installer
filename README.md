# MS-GCM-Debian-Installer

This application installs [Git-Credential-Manager-for-Mac-and-Linux (GCM)](https://github.com/microsoft/Git-Credential-Manager-for-Mac-and-Linux) on Debian and Ubuntu

## Confirmed OS Environment

```bash
$ cat /etc/os-release
NAME="Ubuntu"
VERSION="20.04.1 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.1 LTS"
VERSION_ID="20.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal
```

## Installation

1. Create `settings/git.cfg`

    ```bash
    cp settings/git.cfg.org settings/git.cfg
    ```

1. Edit `settings/git.cfg`

    Change `user_name`, `user_username`, `user_email` to yours.

1. Install GCM

    ```bash
    bash install_ms_gcm.sh
    ```
