import QtQuick
import QtQuick.Layouts
import QtQuick.Templates as T
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

Popup {
    id: control

    property string popupText: "";
    width: 300
    height: 60
    closePolicy: Popup.NoAutoClose
    padding: 5

    background: Rectangle {
        radius: control.height / 4
        color: "#EAF7EE"
        border {
            width: 2
            color: "#CEE4D2"
        }
    }

    RowLayout {
        id: rowLayout
        anchors.fill: parent
        spacing: 16

        Rectangle {
            id: rectImage
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: 50
            Layout.fillHeight: true
            color: "#37B359"
            radius: height / 4

            Rectangle {
                anchors.centerIn: parent
                width: 36
                height: 36
                radius: width / 2
                color: "white"

                Image {
                    anchors.centerIn: parent
                    width: 24
                    height: 24
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/images/check.svg"
                }
            }
        }

        Text {
            text: control.popupText
            font {
                pointSize: 12.5
                weight: Font.DemiBold
            }
            verticalAlignment: Text.AlignLeft
            color: "#1a1a1a"
        }

        Item {
            Layout.fillWidth: true
        }
    }

    onAboutToShow: popupTimer.start()

    Timer {
        id: popupTimer
        interval: 1000
        repeat: false
        onTriggered: control.close()
    }

    function showPopup(displayText) {
        control.popupText = displayText
        control.open()
    }
}

