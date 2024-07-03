import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: revealButton
    hoverEnabled: true
    width: 32
    height: 32

    x: passwordField.width - loginButton.width

    Text {
        id: revealText
        color: "black"
        text: String.fromCodePoint(0xe18b)
        font.family: Qt.resolvedUrl("../fonts") ? "Segoe Fluent Icons" : iconfont.name
        font.pointSize: 10
        renderType: Text.NativeRendering
        anchors.centerIn: parent
    }

    background: Rectangle {
        id: revealButtonBackground
        color: "white"
    }

    states: [
        State {
            name: "on"
            when: revealButton.down
            PropertyChanges {
                target: passwordField
                echoMode: TextInput.Normal
            }
            PropertyChanges {
                target: passwordFieldPin
                echoMode: TextInput.Normal
            }
            PropertyChanges {
                target: revealButtonBackground
                color: config.Color
            }
            PropertyChanges {
                target: revealText
                color: "white"
            }
        },
        State {
            name: "off"
            PropertyChanges {
                target: passwordField
                echoMode: TextInput.Password
            }
            PropertyChanges {
                target: passwordFieldPin
                echoMode: TextInput.Password
            }
        },
        State {
            name: "hovered"
            when: revealButton.hovered
            PropertyChanges {
                target: revealText
                color: config.Color
            }
        }
    ]
}
