  import QtQuick
  import QtQuick.Layouts
  import Quickshell
  import Quickshell.Services.SystemTray

Rectangle {
  anchors {
    left: parent.left
    top: parent.top
    bottom: parent.bottom

    leftMargin: 500
    }

  implicitHeight: 34
  implicitWidth: 150

  color: "#121212"
  radius: 20

  RowLayout {
    id: row
    anchors {
      fill: parent
      leftMargin: 10
    }
    spacing: 5

    Repeater {
      model: SystemTray.items

      delegate: Item {
        height: 34
        width: 30

        Image {
          anchors.fill: parent
          source: modelData.icon
          fillMode: Image.PreserveAspectFit
        }
      }
    }
  }
}

