import QtQuick
import QtQuick.Layouts
import QtQuick.Templates as T
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

Popup {
    id: control

    property string popupText: ""
    property int index

    signal updateText(string newText, int index)

    width: 300
    height: 150
    closePolicy: Popup.NoAutoClose
    padding: 10
    modal: true

    background: Rectangle {
        radius: control.height / 4
        color: "#1e1e1e"
    }

    ColumnLayout {
        id: rowLayout
        anchors.fill: parent
        spacing: 16

        TextField {
            id: editTxt

            Layout.fillWidth: true

            text: control.popupText
            color: "#fafafa"
            placeholderTextColor: "#777"

            leftPadding: 16
            rightPadding: 16

            background: Rectangle {
                color: "#363636"
                radius: 16
            }
        }

        Button {
            id: btnSave

            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 200
            Layout.preferredHeight: 40

            leftPadding: 20
            rightPadding: 20

            contentItem: Text {
                text: "Update Task"
                font.pointSize: 12
                color: "#fff"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            background: Rectangle {
                anchors.fill: parent
                color: btnSave.hovered ? Qt.darker("#2ba84a", 1.2) : "#2ba84a"
                radius: 10
            }

            MouseArea {
                id: btnMouseArea

                propagateComposedEvents: true
                anchors.fill: btnSave
                hoverEnabled: true

                onHoveredChanged: {
                    btnMouseArea.cursorShape = Qt.PointingHandCursor
                }

                onClicked: {
                    updateText(editTxt.text, index)
                    control.close()
                }
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }

    function showPopup(displayText, index) {
        control.popupText = displayText
        control.index = index
        control.open()
    }
}
