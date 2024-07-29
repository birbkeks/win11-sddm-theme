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
   
![win11-sddm-gallery1](https://github.com/user-attachments/assets/b56e9b3b-249a-4bb0-8a42-4d29f2c45f42)
![win11-sddm-gallery2](https://github.com/user-attachments/assets/03fc5fc1-442a-42ff-8224-fe66c7e437ca)
![win11-sddm-gallery3](https://github.com/user-attachments/assets/272895f4-0f67-43d7-992e-95cf676a2ebb)
![win11-sddm-gallery4](https://github.com/user-attachments/assets/3ece6da2-15d1-485b-9557-a57c759cd8db)
![win11-sddm-gallery5](https://github.com/user-attachments/assets/d335876a-f3e8-4f7e-92e7-a206b39758ce)

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
