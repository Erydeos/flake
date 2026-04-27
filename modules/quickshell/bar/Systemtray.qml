  import QtQuick
  import QtQuick.Layouts
  import Quickshell
  import Quickshell.Services.SystemTray
  import qs.theme
  import Quickshell.Widgets


Rectangle {
  anchors {
    left: parent.left
    top: parent.top

    leftMargin: 500
    }

  implicitHeight: 34
  implicitWidth: row.width + 5

  color: Colors.bg
  radius: 20

  RowLayout {
    id: row
    anchors {
      centerIn: parent
      leftMargin: 10
    }
    spacing: 5
    implicitWidth: childrenRect.width
    implicitHeight: parent.height

    Repeater {
      model: SystemTray.items

      delegate: Item {
        height: parent.height
        width: height

        Image {
          anchors.fill: parent
          source: modelData.icon
          fillMode: Image.PreserveAspectFit
        }
      }

    }
  }
}

