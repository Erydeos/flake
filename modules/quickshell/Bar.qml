import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Services.SystemTray
import QtQuick.Shapes




Scope {
    id: root

    Time { id: timeSource }

    Theme {}

    PanelWindow {
        id: bar

        surfaceFormat {
        opaque: false
        }

        anchors {
        top: true
        right: true
        left: true
        }

        readonly property int height: 34
        readonly property int spacer: 5

        implicitHeight: height

        margins {
        bottom: 5
        }

        color: "transparent"

        Audio {}
        Systemtray {}
        Workspaces {}
        Clock {
        time: timeSource.time
        }
    }
}
