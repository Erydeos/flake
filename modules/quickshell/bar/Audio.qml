import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import qs.theme

Rectangle {
  anchors {
    left: parent.left
    top: parent.top

    leftMargin: 150
    }

  implicitHeight: 34
  implicitWidth: 100

  color: Colors.bg
  radius: 20


    Rectangle {
        anchors.centerIn: parent

        implicitHeight: 34
        implicitWidth: 100

        radius: 20


        color: {
            if (mouseArea.containsMouse) return Colors.ac
            return "transparent"
        }

        Text {
            anchors.centerIn: parent
            text: "Audio "
            color: Colors.text
            font.pixelSize: 18
            font.family: "Maple Mono"
            font.bold: true
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent

            hoverEnabled: true

            onClicked: {
                pavuLauncher.running = true
            }
        }
    }


  Process {
    id: pavuLauncher
    command: ["pavucontrol"] // The command must be an array
    }   

}