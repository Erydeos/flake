import Quickshell
import Quickshell.Io
import QtQuick

Scope {

  Process {
    id: themePicker
    command: ["sh", "-c", "ut"]
    running: true
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: themePicker.running = true
  }
  
}