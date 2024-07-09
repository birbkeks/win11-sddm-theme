# Windows 11 Login Screen SDDM Theme

## Table of contents

1. [Gallery](#gallery)
2. [Missing Features](#missing-features)
3. [Requirement](#requirements)
4. [Installation](#installation)
   - [From KDE Plasma system settings](#from-kde-plasma-system-settings)
   - [Manual installation on KDE Plasma desktop environment](#manual-installation-on-kde-plasma-desktop-environment)
   - [If you're not using KDE Plasma](#if-youre-not-using-kde-plasma)

5. [Testing](#testing)

## Gallery

<details>
  <summary>Click to view screenshots</summary>
   
![win11-gallery1](https://github.com/birbkeks/win11-sddm-theme/assets/67545942/0bc55a63-8720-42b8-b024-0376d84d1588)
   
![win11-gallery2](https://github.com/birbkeks/win11-sddm-theme/assets/67545942/dd7c8ea3-f866-447e-ab29-72dbc18d8c1e)

![win11-gallery3](https://github.com/birbkeks/win11-sddm-theme/assets/67545942/de64f895-ab51-4769-82fe-623dff9a528f)

![win11-gallery4](https://github.com/birbkeks/win11-sddm-theme/assets/67545942/4c943e42-46d5-4283-b360-4eb21c4b91dd)


</details>

## Missing Features
Missing features from Windows 11 login screen that's planned to be added in the future:

- Internet icons
- On-Screen Keyboard
- Successful login message [(this is a SDDM bug, waiting it to be fixed)](https://github.com/sddm/sddm/issues/1960)

## Requirements

>[!IMPORTANT]
>Please install [Segoe UI Variable Static Display](https://aka.ms/SegoeUIVariable) and
    [Segoe Fluent Icons](https://aka.ms/SegoeFluentIcons)
      font to use this SDDM theme!

You only need to have SDDM installed and don't need any other extra Qt 5 or 6 plugins to install!

## Installation

You can use installation script to install this theme, [required fonts](#requirements) and [Windows Cursors](https://github.com/birbkeks/windows-cursors)! 

```
wget https://raw.githubusercontent.com/birbkeks/win11-sddm-theme/main/install.sh
chmod +x install.sh
./install.sh
```

>[!IMPORTANT]
>Please make sure to install [required fonts](#requirements) first!

### From KDE Plasma system settings:
1. Open System Settings.
2. Go to Colors & Themes and click on Login Screen (SDDM).
3. Click on "Get New..." and search for this theme, and install it from there.

### Manual installation on KDE Plasma desktop environment:
1- You can download this theme from [github releases](https://github.com/birbkeks/win11-sddm-theme/releases) or from [store.kde.org](https://store.kde.org/p/2173243) page! <br>
2- Extract "win11-sddm-theme.tar.gz" to `/usr/share/sddm/themes`. <br>
3- Edit /etc/sddm.conf.d/kde_settings.conf  and under `[Theme]`, change `Current=` to `Current=win11-sddm-theme`.

### If you're not using KDE Plasma:
1- You can download this theme from [github releases](https://github.com/birbkeks/win11-sddm-theme/releases) or from [store.kde.org](https://store.kde.org/p/2173243) page! <br>
2- Extract "win11-sddm-theme.tar.gz" to `/usr/share/sddm/themes`. <br>
3- Edit /etc/sddm.conf  and under `[Theme]`, change `Current=` to `Current=win11-sddm-theme`.

## Testing

If you want to test this theme before using it, you can use this command on your terminal to test this or other SDDM themes. Make sure to replace "/path/to/directory" with the directory of SDDM theme you installed.

```
env -i HOME=$HOME DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY sddm-greeter-qt6 --test-mode --theme /path/to/directory
```
