#!/bin/bash

echo ""

echo " (1) - Install Windows 11 SDDM Theme"
echo " (2) - Install Required Segoe UI fonts"
echo " (3) - Install Windows Cursor Icons"

echo ""

echo "Please type only number(s) to pick options: (e.g: "1 2")"
   
read -p ":: " input

function sddm() {

    sudo wget -P /usr/share/sddm/themes https://github.com/birbkeks/win11-sddm-theme/releases/download/1.0/win11-sddm-theme.tar.gz -nc

    sudo tar -xzf /usr/share/sddm/themes/win11-sddm-theme.tar.gz -C /usr/share/sddm/themes

    sudo rm -rf /usr/share/sddm/themes/win11-sddm-theme.tar.gz

    sudo rm -rf /usr/share/sddm/themes/win11-sddm-theme/.git/

    edit
}

function edit() {

    if [[ $XDG_CURRENT_DESKTOP == "KDE" ]]; then

    sudo sed -i 's/Current=/Current=win11-sddm-theme/' /etc/sddm.conf.d/kde_settings.conf

    else

    sudo sed -i 's/Current=/Current=win11-sddm-theme/' /etc/sddm.conf

    fi
}

function font() {
    # Not installed locally because I can't stand to see this font on Github and other websites, I couldn't find a way to disable this font for browser. I'm used to see Noto Sans too much I guess. You can go to this fonts files and install it locally if you want to and this theme will still work.

    sudo wget -P /usr/share/sddm/themes/win11-sddm-theme/fonts/SegoeUI-VF https://aka.ms/SegoeUIVariable -nc  

    sudo bsdtar xf /usr/share/sddm/themes/win11-sddm-theme/fonts/SegoeUI-VF/SegoeUIVariable -C /usr/share/sddm/themes/win11-sddm-theme/fonts/SegoeUI-VF
    

    sudo wget -P /usr/share/sddm/themes/win11-sddm-theme/fonts/Segoe-Fluent-Icons https://aka.ms/SegoeFluentIcons -nc

    sudo bsdtar xf /usr/share/sddm/themes/win11-sddm-theme/fonts/Segoe-Fluent-Icons/SegoeFluentIcons -C /usr/share/sddm/themes/win11-sddm-theme/fonts/Segoe-Fluent-Icons

    sudo mv '/usr/share/sddm/themes/win11-sddm-theme/fonts/Segoe-Fluent-Icons/Segoe Fluent Icons.ttf' /usr/share/sddm/themes/win11-sddm-theme/fonts/Segoe-Fluent-Icons/Segoe-Fluent-Icons.ttf
}

function cursor() {
    sudo wget -P /usr/share/icons https://github.com/birbkeks/windows-cursors/releases/download/1.0/windows-cursors.tar.gz -nc

    sudo tar -xzf /usr/share/icons/windows-cursors.tar.gz -C /usr/share/icons/

    sudo cp /usr/share/icons/windows-cursors/index.theme /usr/share/icons/default/index.theme

    sudo cp -r /usr/share/icons/windows-cursors/cursors /usr/share/icons/default

    sudo rm -rf /usr/share/icons/windows-cursors

    sudo rm -f /usr/share/icons/windows-cursors.tar.gz
}

if [[ $input == "1" ]]; then

    echo ""
    echo "Installing Windows 11 SDDM Theme..."
    echo ""

    sddm

    echo "Done."

elif [[ $input == "2" ]]; then

    echo ""
    echo "Required Segoe UI fonts..."
    echo ""

    font

    echo "Done."

elif [[ $input == "3" ]]; then

    echo ""
    echo "Install Windows Cursor Icons..."
    echo ""

    cursor

    echo "Done."


elif [[ $input == "1 2" ]]; then

    echo ""
    echo "Install Windows Cursor Icons and Required Segoe UI fonts..."
    echo ""

    sddm
    font

    echo "Done."

elif [[ $input == "1 2 3" ]]; then

    echo ""
    echo "Install Windows Cursor Icons, Required Segoe UI fonts and Windows Cursor Icons..."
    echo ""

    sddm
    font
    cursor

    echo "Done."

elif [[ $input == "2 3" ]]; then

    echo ""
    echo "Required Segoe UI fonts and Windows Cursor Icons..."
    echo ""

    font
    cursor

    echo "Done."

else

    echo ""
    echo "Invalid number, please try again."; exit 1

fi
