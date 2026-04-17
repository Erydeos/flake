import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.theme
import QtQuick.Controls
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Services.SystemTray
import QtQuick.Shapes
import qs.custom
import qs.bar



Scope {
    id: root

    PanelWindow {
        id: bar
        anchors {
            top: true
            bottom: true
            right: true
            left: true
        }

        WlrLayershell.layer: WlrLayer.Top
        color: "transparent"
        surfaceFormat.opaque: false
        exclusiveZone: 0 

        mask: Region { 
            Region { item: workspaces }
            Region { item: audio } 
            Region { item: clock } 
            Region { item: systemtray }
            Region { item: drawer }   

        }
        
        readonly property int height: 34
        readonly property int spacer: 5


        Time { id: timeSource }
        Theme {}
        
        
        Audio { id: audio}
        Systemtray { id: systemtray}
        Workspaces { id: workspaces }
        Clock { id: clock; time: timeSource.time}
        Drawer { id: drawer}
    }
}

