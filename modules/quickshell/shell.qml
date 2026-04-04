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

    //Border {}

    PanelWindow {
      id: bar
      anchors {
        top: true
        right: true
        left: true
      }
      
      exclusionMode: ExclusionMode.Ignore
      aboveWindows: true

      readonly property int height: 34
      readonly property int spacer: 5

      implicitHeight: height



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
}