import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects

FocusScope {

    property alias icon: icon.source

    property alias name: name.text

    property alias password: passwordField.text

    property alias passwordpin: passwordFieldPin.text

    property int session: sessionPanel.session

    Connections {
      target: sddm

        function onLoginFailed() {

            passwordField.visible = false
            passwordField.enabled = false
            passwordField.focus = false

            passwordFieldPin.visible = false
            passwordFieldPin.enabled = false
            passwordFieldPin.focus = false

            falsePass.visible = true
            falsePass.focus = true
        }

        function onLoginSucceeded() {

            passwordField.visible = false

            passwordFieldPin.visible = false

            truePass.visible = true
        }
    }

    Image {
        id: icon
        width: 192
        height: 192
        smooth: true
        visible: false

        x: -(icon.width / 2)
        y: -(icon.width * 2) + (icon.width * 0.8)
    }

    OpacityMask {
        anchors.fill: icon
        source: icon
        maskSource: mask
    }

    Item {
        id: mask
        width: icon.width
        height: icon.height
        layer.enabled: true
        visible: false

        Rectangle {
            width: icon.width
            height: icon.height
            radius: width / 2
            color: "black"
        }
    }

    Text {
        id: name
        color: "white"
        font.pointSize: 40
        font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
        renderType: Text.NativeRendering

        anchors {
            topMargin: 15
            horizontalCenter: icon.horizontalCenter
            top: icon.bottom
        }
    }

    PasswordField {
        id: passwordField
        visible: config.PinMode === "off" ? true : false
        enabled: config.PinMode === "off" ? true : false
        focus: config.PinMode === "off" ? true : false
        x: -135

        anchors {
            topMargin: 25
            top: name.bottom
        }

        onTextChanged: {
            if (passwordField.text !== "") {
                passwordField.width = 226
                loginButton.x = passwordField.width + loginButton.width + 1
                revealButton.x = passwordField.width
                revealButton.visible = true
            }

            else {
                passwordField.width = 258
                revealButton.visible = false
            }
        }

        Keys.onReturnPressed: sddm.login(model.name, password, session)
        Keys.onEnterPressed: sddm.login(model.name, password, session)

        LoginBg {
            id: loginBg

            x: -3

            LoginButton {
                id: loginButton
                visible: true

                ToolTip {
                    id: loginButtonTip

                    delay: 1000
                    timeout: 4800
                    leftPadding: 9
                    rightPadding: 9
                    topPadding: 7
                    bottomPadding: 7
                    visible: loginButton.hovered

                    contentItem: Text {
                        text: "Submit"
                        font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
                        renderType: Text.NativeRendering
                        color: "white"
                    }

                    background: Rectangle {
                        color: "#2A2A2A"
                        border.width: 1
                        border.color: "#1A1A1A"
                    }
                }

                onClicked: {
                    sddm.login(model.name, password, session)
                    loginButtonTip.hide()
                }
            }

            RevealButton {
                id: revealButton
                visible: false
            }
        }
    }

    PasswordFieldPin {
        id: passwordFieldPin
        visible: config.PinMode === "off" ? false : true
        enabled: config.PinMode === "off" ? false : true
        focus: config.PinMode === "off" ? false : true

        x: -135

        validator: IntValidator { // this dude allows only numbers to be typed, if something goes wrong, blame this dude.
            bottom: 8
            top: 1000
        }

        anchors {
            topMargin: 25
            top: name.bottom
        }

        onTextChanged: {
            if (passwordFieldPin.text !== "") {
                passwordFieldPin.width = 257
                revealButtonPin.x = passwordFieldPin.width
                revealButtonPin.visible = true
            }

            else {
                passwordFieldPin.width = 289
                revealButtonPin.visible = false
            }

            if (passwordFieldPin.length > 3 ) {
                sddm.login(model.name, passwordpin, session)
            }
        }

        LoginBg {
            id: loginBgPin

            x: -3

            RevealButton {
                id: revealButtonPin
                visible: false
            }
        }
    }

    FalsePass {
        id: falsePass
        visible: false

        anchors {
            horizontalCenter: parent.horizontalCenter
            topMargin: 25
            top: name.bottom
        }
    }

    TruePass {
        id: truePass
        visible: false

        anchors {
            horizontalCenter: parent.horizontalCenter
            topMargin: 25
            top: name.bottom
        }
    }

    CapsOn {
        id: capsOn
        visible: false

        state: keyboard.capsLock ? "on" : "off"

        states: [
            State {
                name: "on"
                PropertyChanges {
                    target: capsOn
                    visible: true
                }
            },

            State {
                name: "off"
                PropertyChanges {
                    target: capsOn
                    visible: false
                }
            }
        ]

        anchors {
            horizontalCenter: parent.horizontalCenter
            topMargin: 25
            top: passwordField.bottom
        }
    }
}
