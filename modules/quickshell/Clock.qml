import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io



    Rectangle {
        anchors {
        right: parent.right
        top: parent.top
        bottom: parent.bottom

        rightMargin: 50
        }

        implicitHeight: 34
        implicitWidth: 400

        color: "#121212"
        radius: 20

        RowLayout {
            anchors.fill: parent
            spacing: 10
            
            Rectangle {
                anchors.centerIn: parent

                implicitHeight: 30

                Text {
                    id: clock
                    anchors.centerIn: parent
                    text: root.time
                    
                    color: "white"
                    font.pixelSize: 18
                    font.family: "Maple Mono"
                    font.bold: true
                }
            }
        }
    }

