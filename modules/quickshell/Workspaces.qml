  import QtQuick
  import QtQuick.Layouts
  import Quickshell
  import Quickshell.Wayland
  import Quickshell.Hyprland

  Rectangle {
    anchors.centerIn: parent
    implicitHeight: bar.height
    implicitWidth: bar.width
    
    color: "#121212"
    radius: 20


    RowLayout {
      anchors.fill: parent
      spacing: bar.spacer

      Repeater {
        model: 5

        Rectangle {
          implicitHeight: bar.height
          implicitWidth: {
            if (isActive) return 60
            return "35"
          }

          radius: 25

          property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
          property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

          color: {
            if (isActive) return "#3a3a3a"
            if (mouseArea.containsMouse) return "#3a3a3a"
            return "transparent"
          }

          Text {
            anchors.centerIn: parent


            text: index + 1
            color: "white"
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

          implicitHeight: bar.height
          implicitWidth: bar.specialWidth

          radius: 25

          readonly property bool isActive: Hyprland.focusedWorkspace?.id === ws.id


          color: {
          if (isActive) return "#3a3a3a"
          if (mouseArea.containsMouse) return "#3a3a3a"
          return "transparent"
          }

          Text {
            anchors.centerIn: parent
            text: ws.name.replace("special:", "").substring(0, 5)
            font.pixelSize: 18
            font.bold: true
            color: "white"
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
