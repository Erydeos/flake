import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.theme
import QtQuick.Controls
import Quickshell.Io


 Rectangle {
    id: rootWindow

    Cpu { id: cpu }

    anchors {
        right: parent.right
        top: parent.top
        rightMargin: 400
    }

    property int drawerHeight: bar.height
    height: drawerHeight
    width: 600

    color: "transparent"

    Behavior on height {
        NumberAnimation {
            duration: 300       // 300 milliseconds
            easing.type: Easing.InOutQuad // Smooth start and end
        }
    }


    Drawer {
        id: rightDrawer
        anchors {
            centerIn: parent
        }
        parent: rootWindow.contentItem
        modal: false

        edge: Qt.TopEdge
        width: parent.width
        height: parent.height

        background: Rectangle {
            color: "transparent"
        }

        contentItem: Item {

            CustomShape { id: backgroundShape }

            GridLayout {
                columns: 4
                rows: 4

                columnSpacing: 5
                rowSpacing: 5

                anchors {
                    centerIn: parent
                }

                Rectangle {
                    Layout.column: 0
                    Layout.row: 0

                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 100

                    radius: 5
                    color: Colors.ac

                    Text {
                        anchors.centerIn: parent
                        text: "CPU: " + cpu.cpuText
                        color: "white"
                        font.pixelSize: 16
                    }
                }
                Rectangle {
                    Layout.column: 1
                    Layout.row: 1

                    Layout.preferredWidth: 50
                    Layout.preferredHeight: 50

                    radius: 5
                    color: "blue"
                }
                Rectangle {
                    Layout.column: 2
                    Layout.row: 2

                    Layout.preferredWidth: 50
                    Layout.preferredHeight: 50

                    radius: 5
                    color: "blue"
                }

                Rectangle {
                    Layout.column: 3
                    Layout.row: 3

                    Layout.preferredWidth: 50
                    Layout.preferredHeight: 50

                    radius: 5
                    color: "blue"
                }
                
        
            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    rightDrawer.close();
                    rootWindow.drawerHeight = bar.height;
                }
            }
        }
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            rootWindow.drawerHeight = 600;
            Qt.callLater(rightDrawer.open());
        }
    }

}
