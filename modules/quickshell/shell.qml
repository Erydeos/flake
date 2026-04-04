  import QtQuick
  import QtQuick.Layouts
  import Quickshell
  import Quickshell.Wayland
  import Quickshell.Hyprland
  import Quickshell.Io
  import Quickshell.Services.SystemTray


  ShellRoot {
    Component.onCompleted: {
        console.log("SystemTray is active. Current items:", SystemTray.items.length)
    }
    Scope {
      id: root

      Time { id: timeSource }
      
      PanelWindow {
        id: bar
        anchors {
          top: true
          right: true
          left: true
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

        Audio {}
        Systemtray {}
        Workspaces {}
        Clock {
          time: timeSource.time
        }
      }
    }
    //Border {} ///////////////////////////////////////////////////////////////
  }