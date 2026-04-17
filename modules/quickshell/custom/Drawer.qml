import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.theme
import QtQuick.Controls

 Rectangle {
    id: rootWindow

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
                columns: 2
                rows: 2

                columnSpacing: 5
                rowSpacing: 5

                anchors {
                    fill: backgroundShape
                }
                
                width: backgroundShape.width * 0.8
                Layout.fillWidth: true
                Layout.fillHeight: true

                Rectangle {
                    Layout.column: 0
                    Layout.row: 0

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