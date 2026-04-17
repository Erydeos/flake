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
            Shape {}

            ColumnLayout {

                anchors {
                    fill: parent
                    leftMargin: 20
                    rightMargin: 20
                }

                spacing: 20

                Text {
                    text: "Testing"
                    color: Colors.text
                    font.bold: true
                    Layout.alignment: Qt.AlignHCenter
                }

                Rectangle {
                    Layout.preferredWidth: parent.width * 0.8
                    Layout.alignment: Qt.AlignHCenter
                    height: 40
                    color: Colors.sec
                    
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
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            rootWindow.drawerHeight = 600;
            Qt.callLater(rightDrawer.open());
        }
    }
}