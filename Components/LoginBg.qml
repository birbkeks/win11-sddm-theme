import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: loginBg
    hoverEnabled: true
    width: 0
    height: 0

    background: Rectangle {
        id: loginbgBackground
        width: 293
        height: 36
        x: -2
        y: -2
        color: "transparent"
        border.color: "#70FFFFFF"
        border.width: 2
    }

    states: [
        State {
            name: "hovered"
            when: loginButton.hovered
            PropertyChanges {
                target: loginbgBackground
                border.color: "#FFFFFF"
                width: loginbgBackground.width
                height: loginbgBackground.height
            }
        },

        State {
            when: revealButton.hovered
            PropertyChanges {
                target: loginbgBackground
                border.color: "#FFFFFF"
                width: loginbgBackground.width
                height: loginbgBackground.height
            }
        },

        State {
            when: passwordField.hovered
            PropertyChanges {
                target: loginbgBackground
                border.color: "#FFFFFF"
                width: loginbgBackground.width
                height: loginbgBackground.height
            }
        }
    ]
}
