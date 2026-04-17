import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import qs.theme




    Rectangle {
        id: clockRoot
        required property string time

        anchors {
        right: parent.right
        top: parent.top
        bottom: parent.bottom

        rightMargin: 100
        }

        implicitHeight: 34
        implicitWidth: 250

        color: Colors.bg
        radius: 20

        RowLayout {
            id: row
            anchors.fill: parent
            spacing: 10
            
            Rectangle {
                Layout.alignment: Qt.AlignCenter

                implicitHeight: 30

                Text {

                    
                    id: clock
                    anchors.centerIn: parent
                    text: clockRoot.time
                    
                    color: Colors.text
                    font.pixelSize: 18
                    font.family: "Maple Mono"
                    font.bold: true
                }
            }
        }
    }

