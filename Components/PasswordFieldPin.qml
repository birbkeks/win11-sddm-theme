import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects

TextField {
    id: passwordFieldPin
    focus: true
    visible: true
    selectByMouse: true
    placeholderText: "PIN"
    placeholderTextColor: "white"

    property alias text: passwordFieldPin.text

    echoMode: TextInput.Password ? TextInput.Password : TextInput.Normal
    selectionColor: config.color

    font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
    font.pointSize: 10.5
    renderType: Text.NativeRendering

    color: "white"

    horizontalAlignment: TextInput.AlignLeft
    width: 296
    height: 36
}
