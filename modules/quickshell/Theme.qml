import Quickshell
import Quickshell.Io
import QtQuick

Scope {

  Process {
    id: themePicker
    command: ["sh", "-c", "/home/elliot/nixos/modules/scripts/wp-theme-sync.sh"]
    
    onExited: (exitCode) => {
        if (exitCode === 0) {
            Quickshell.reload(true);
        } 
    }
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: themePicker.running = true
  }
  
}