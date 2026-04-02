  import QtQuick
  import QtQuick.Layouts
  import Quickshell
  import Quickshell.Wayland
  import Quickshell.Hyprland

  ShellRoot {
    PanelWindow {
      id: window
      anchors {
        top: true
      }
      readonly property int height: 34
      
      readonly property int activeWidth: 60
      readonly property int passiveWidth: 35
      readonly property int spacer: 5
      readonly property int specialWidth: 70
      readonly property int width: activeWidth + passiveWidth*4 + spacer*7 + specialWidth*3

      implicitHeight: height
      implicitWidth: width

      margins {
        top: 5
        bottom: 5
      }

      HyprlandWindow.opacity: 0.8

      color: "transparent"
      Rectangle {
        implicitHeight: window.height
        implicitWidth: window.width
        
        color: "#121212"
        radius: 20


        RowLayout {
          anchors.fill: parent
          spacing: window.spacer

          Repeater {
            model: 5

            Rectangle {
              implicitHeight: window.height
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

              implicitHeight: window.height
              implicitWidth: window.specialWidth

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
    }
  }