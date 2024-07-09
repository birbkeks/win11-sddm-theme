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

            rightPanel.visible = false
            leftPanel.visible = false

            falsePass.visible = true
            falsePass.focus = true
        }

        function onLoginSucceeded() {}
    }

    Image {
        id: icon
        width: 192
        height: 192
        smooth: true
        visible: false

        onStatusChanged: {
            if (icon.status == Image.Error)
                icon.source = "../user-192.png"
            else
                "/var/lib/AccountsService/icons/" + name
        }

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
        font.pointSize: 27
        font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeuisb.name
        font.weight: Font.DemiBold
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

        Keys.onReturnPressed: {
            truePass.visible = true
            passwordField.visible = false
            passwordFieldPin.visible = false
            rightPanel.visible = false
            leftPanel.visible = false
            sddm.login(model.name, password, session)
        }

        Keys.onEnterPressed: {
            truePass.visible = true
            passwordField.visible = false
            passwordFieldPin.visible = false
            rightPanel.visible = false
            leftPanel.visible = false
            sddm.login(model.name, password, session)
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

    Rectangle {
        id: truePass
        x: 1
        y: 1
        color: "transparent"
        visible: false

        anchors {
            horizontalCenter: parent.horizontalCenter
            topMargin: 25
            top: name.bottom
        }

        Text {
            id: welcome
            color: "white"
            font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeuisb.name
            text: "Welcome"
            renderType: Text.NativeRendering
            font.weight: Font.DemiBold
            font.pointSize: 17
            anchors.centerIn: parent
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
            top: passwordField.bottom
            topMargin: 25
        }
    }
}
