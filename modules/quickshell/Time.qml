import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    id: timeRoot
    property string time: {
        Qt.formatDateTime(clock.date, "ddd  MMM d hh:mm AP")
    }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}