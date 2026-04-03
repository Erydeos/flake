import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    id: timeRoot
    property string time

    Process {
        id: dateProc
        command: ["date"]
        running: true

        stdout: StdioCollector {
        onStreamFinished: timeRoot.time = this.text
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }
}