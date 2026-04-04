import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: root
    color: "transparent"
    
    // Fill the screen
    anchors {
        top: true; bottom: true
        left: true; right: true
    }

    // Corrected attached property and click-through logic
    WlrLayershell.layer: WlrLayer.Overlay
    
    // Use Xor to make the borderRect NOT clickable
    mask: Region { 
        item: borderRect
        intersection: Intersection.Xor 
    }

    Rectangle {
        id: borderRect
        anchors.fill: parent
        color: "transparent"
        
        // Your curved border settings
        border.color: "black" 
        border.width: 10 
        radius: 25 
        antialiasing: true
        
        // This is important: ensure the rectangle itself doesn't 
        // try to catch mouse events internally
        MouseArea {
            anchors.fill: parent
            propagateComposedEvents: true
            onPressed: (mouse) => mouse.accepted = false
        }
    }
}
