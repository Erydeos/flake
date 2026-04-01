  import QtQuick
  import Quickshell

  ShellRoot {
    PanelWindow {
      width: 500
      height: 50
      color: "black"
      Text {
        text: "Hello from Quickshell!"
        color: "white"
        anchors.centerIn: parent
      }
    }
  }