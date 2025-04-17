import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material
import QMLTodoApp

Window {
    id: root
    width: 400
    height: 600
    visible: true
    title: qsTr("Todo App")
    color: "#1e1e1e"

    ColumnLayout {
        anchors {
            fill: parent
            margins: 10
            topMargin: 30
            bottomMargin: 30
        }

        spacing: 10

        CustomTextField {
            Layout.preferredWidth: 350
            Layout.preferredHeight: 40
            Layout.alignment: Qt.AlignHCenter

        }

        RowLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 16
            Layout.rightMargin: 16
            spacing: 5

            Text {
                text: BackendHelper.currentDay
                font {
                    pointSize: 36
                    weight: Font.DemiBold
                }
                color: "#fff"
            }

            ColumnLayout {
                spacing: 0

                Text {
                    text: BackendHelper.currentMonth
                    font {
                        pointSize: 14
                        weight: Font.DemiBold
                    }
                    color: "#ddd"
                }

                Text {
                    text: BackendHelper.currentYear
                    font {
                        pointSize: 12
                        weight: Font.DemiBold
                    }
                    color: "#aaa"
                }
            }

            Item {
                Layout.fillWidth: true
            }

            Text {
                text: BackendHelper.currentDayName
                font {
                    pointSize: 12
                    weight: Font.Medium
                }
                color: "#fff"
            }
        }

        ListView {
            id: todoList
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.leftMargin: 16
            Layout.rightMargin: 16

            model: todoModel
            delegate: todoDelegate

            clip: true
            spacing: 4
            boundsBehavior: Flickable.StopAtBounds
            ScrollBar.vertical: CustomScrollBar { }
        }

        Button {
            id: btnAdd

            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 200
            Layout.preferredHeight: 40

            leftPadding: 20
            rightPadding: 20

            contentItem: Text {
                text: "Add Task"
                font.pointSize: 12
                color: "#ffffff"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            background: Rectangle {
                anchors.fill: parent
                color: btnAdd.hovered ? Qt.darker("#2ba84a", 1.2) : "#2ba84a"
                radius: 10
            }

            MouseArea {
                id: btnMouseArea

                propagateComposedEvents: true
                anchors.fill: btnAdd
                hoverEnabled: true

                onHoveredChanged: {
                    btnMouseArea.cursorShape = Qt.PointingHandCursor
                }

                onClicked: {
                    todoModel.append({ task: "New Task => " + (todoModel.count + 1)})
                    notificationPopup.showPopup("Item added Successfully !")
                }
            }
        }

    }

    Component {
        id: todoDelegate

        Rectangle {
            id: recDelegate
            required property string task
            required property int index

            width: todoList.width
            height: 50
            color: "#363636"
            radius: 12

            RowLayout {
                width: parent.width
                anchors.verticalCenter: parent.verticalCenter

                Text {
                    Layout.fillWidth: true
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    text: task
                    font.pointSize: 13
                    color: "#fafafa"
                }

                Item {
                    Layout.fillWidth: true
                }

                Image {
                    id: imgEdit

                    Layout.preferredWidth: 20
                    Layout.preferredHeight: 20
                    Layout.rightMargin: 10
                    Layout.alignment: Qt.AlignVCenter

                    source: "qrc:/images/edit.svg"

                    MouseArea {
                        id: editMouseArea

                        propagateComposedEvents: true
                        anchors.fill: parent
                        hoverEnabled: true

                        onHoveredChanged: {
                            editMouseArea.cursorShape = Qt.PointingHandCursor
                        }

                        onClicked: {
                            editItemPopup.showPopup(task, index)
                            notificationPopup.showPopup("Updated the task number " + index)
                        }
                    }
                }

                Image {
                    id: imgDelete

                    Layout.preferredHeight: 20
                    Layout.preferredWidth: 20
                    Layout.rightMargin: 10
                    Layout.alignment: Qt.AlignVCenter

                    source: "qrc:/images/delete.svg"

                    MouseArea {
                        id: deleteMouseArea

                        propagateComposedEvents: true
                        anchors.fill: parent
                        hoverEnabled: true

                        onHoveredChanged: {
                            deleteMouseArea.cursorShape = Qt.PointingHandCursor
                        }

                        onClicked: {
                            todoModel.remove(index)
                            notificationPopup.showPopup("Removing the item\n " + task)
                        }
                    }
                }
            }
        }
    }

    ListModel {
         id: todoModel
         ListElement { task: "Finish the lecture" }
         ListElement { task: "Code on my own" }
         ListElement { task: "Improve both UI/UX" }
         ListElement { task: "Upload code on github" }
    }

    AppPopup {
        id: notificationPopup
        x: (root.width / 2) - notificationPopup.width / 2
        y: 30
        popupText: qsTr("Opened the popup.")
    }

    CustomPopup {
        id: editItemPopup
        anchors.centerIn: parent

        onUpdateText: function(newText, index) {
            todoModel.set(index, { task: newText })
        }
    }
}
