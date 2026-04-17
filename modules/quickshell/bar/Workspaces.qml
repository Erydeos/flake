  import QtQuick
  import QtQuick.Layouts
  import Quickshell
  import Quickshell.Wayland
  import Quickshell.Hyprland
  import qs.theme


  Rectangle {
    anchors {
      top: parent.top
      horizontalCenter: parent.horizontalCenter
    }
    implicitHeight: bar.height
    implicitWidth: row.width

    property int r: 20 
    
    color: Colors.bg
    radius: r


    RowLayout {
      id: row
      anchors.centerIn: parent
      spacing: bar.spacer
      width: childrenRect.width
      height: parent.height

      Repeater {
        model: 5

        Rectangle {
          implicitHeight: bar.height
          implicitWidth: {
            if (isActive) return 60
            return "35"
          }

          radius: r

          property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
          property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

          color: {
            if (isActive) return Colors.ac
            if (mouseArea.containsMouse) return Colors.ac
            if (ws) return Colors.sec
            return "transparent"
          }

          Text {
            anchors.centerIn: parent


            text: index + 1
            color: Colors.text
            font.pixelSize: 18
            font.family: "Maple Mono"
            font.bold: true
          }

          MouseArea {
            id: mouseArea

            anchors.fill:parent

            hoverEnabled: true

            onClicked: {
              if (ws) {
                ws.activate()
              } else {
                hyprland.dispatch('workspace ${index + 1}')
              }
            }
          }
        }
      }

      Repeater {
        model: Hyprland.workspaces.values.filter(ws => ws.id < 0)

        Rectangle {
          readonly property var ws: modelData

          implicitHeight: parent.height
          implicitWidth: 70

          radius: r

          readonly property bool isActive: Hyprland.focusedWorkspace?.id === ws.id


          color: {
          if (isActive) return Colors.ac
          if (mouseArea.containsMouse) return Colors.ac
          return "transparent"
          }

          Text {
            anchors.centerIn: parent
            text: ws.name.replace("special:", "").substring(0, 5)
            font.pixelSize: 18
            font.bold: true
            color: Colors.text
          }

          MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
              let name = ws.name.replace("special:", "")

              Hyprland.dispatch(`togglespecialworkspace ${name}`);
            }
          }
        }
      }
    }
  }
