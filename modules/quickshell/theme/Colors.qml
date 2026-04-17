pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: colors

    /* property color bg: Qt.alpha("#121212", 0.8)
    property color text: "white"
    property color ac: Qt.alpha("#5b917d", 0.8)
    */

    property color bg: Qt.alpha(Matugen.background, 0.6)
    property color text: Qt.alpha(Matugen.text, 0.9)
    property color ac: Qt.alpha(Matugen.primary, 0.6)
    property color sec: Qt.alpha(Matugen.primary, 0.2)
    property color menu: Qt.alpha(Matugen.background, 0.9)
}