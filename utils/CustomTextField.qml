import QtQuick
import QtQuick.Controls.Basic

TextField {
    id: control

    color: "#fafafa"

    placeholderText: qsTr("Search")
    placeholderTextColor: "#777"

    leftPadding: 32
    rightPadding: 16

    background: Rectangle {
        color: "#363636"
        radius: control.height/2
    }

    Image {
        width: 13
        height: width

        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 1
        anchors.left: parent.left
        anchors.leftMargin: 16

        source: "qrc:/images/search.svg"
        opacity: control.text ? 1 : 0.5
    }
}
