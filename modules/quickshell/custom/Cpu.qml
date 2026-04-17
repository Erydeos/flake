import Quickshell
import Quickshell.Io
import QtQuick
import qs.theme

Scope {

    property int lastCpuTotal: 0
    property int lastCpuIdle: 0
    property string cpuText: "0%"
    Process {
        id: cpuProc
        // Using sh -c to ensure we can use head safely
        command: ["sh", "-c", "head -n 1 /proc/stat"]
        
        stdout: SplitParser {
            onRead: data => {
                if (!data) return;
                
                // Format: cpu  user nice system idle iowait ...
                let p = data.trim().split(/\s+/);
                
                // Total ticks (sum of first 7 fields)
                let total = 0;
                for (let i = 1; i <= 7; i++) {
                    total += parseInt(p[i]);
                }
                
                // Idle ticks (field index 4 is idle)
                let idle = parseInt(p[4]);

                if (lastCpuTotal > 0) {
                    let totalDiff = total - lastCpuTotal;
                    let idleDiff = idle - lastCpuIdle;
                    // Standard formula: 100 * (1 - idle_delta / total_delta)
                    let usage = Math.round(100 * (1 - (idleDiff / totalDiff)));
                    cpuText = usage + "%";
                }

                lastCpuTotal = total;
                lastCpuIdle = idle;
            }
        }
    }

    Timer {
        interval: 1000 // 1 second update
        running: true
        repeat: true
        onTriggered: cpuProc.running = true
    }
}