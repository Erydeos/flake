import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

Rectangle {
  anchors {
    left: parent.left
    top: parent.top
    bottom: parent.bottom

    leftMargin: 100
    }

  implicitHeight: 34
  implicitWidth: 100

  color: "#121212"
  radius: 20


    Rectangle {
        anchors.centerIn: parent

        implicitHeight: 34
        implicitWidth: 100

        radius: 20


        color: {
            if (mouseArea.containsMouse) return "#3a3a3a"
            return "transparent"
        }

        Text {
            anchors.centerIn: parent
            text: "Audio "
            color: "white"
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