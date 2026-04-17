import QtQuick
import QtQuick.Shapes
import Quickshell

PanelWindow {
    color: "transparent"

    Shape {
        width: parent.width
        height: parent.height
        antialiasing: true

        ShapePath {
            fillColor: "#121212"
            strokeColor: "transparent"

            startX: 50
            startY: 30

            PathCubic {
                x: 10
                y: 50

                control1X: 0
                control2X: 0

                control1Y: 0
                control2Y: 0
            }

            PathLine {
                x: 200
                y: 30
            }

            PathLine {
                x: 200
                y: 200
            }

        }
    }
}