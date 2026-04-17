// https://www.google.com/search?sourceid=chrome&ie=UTF-8&aep=26&cud=0&qsubts=1775333435188&source=chrome.crn.obic&mstk=AUtExfAV7FjPudleuGFJX2RA6d1jScVfNPothtBb-OCd6Ae0ACKmRsK9JvezK_8_98Me_76j7zbhdnCcZOvmBGFNIpSKgCe4ijzwLmA68bfz5B4_C9WfBZH5WxZ-_TeANER8L7wKNiIfonubJZvSlf-Z75n8I6dA8orA0V8e4aBcK_AJJMUFmkOccGjVEfUI54fynwFFP_m4H5var45n5ab9phsk6ejazax2wknKKBQDZkBhbxqKb8ZRdsg-T7rrNb6559LDFzd0s3o01AXR_CVmOdtkp0rI3rpcWR3kl7pusx2G31j8sXmh2949YcOZ28ZtNOfJIBlTtQlfzA&mtid=IOHQaa6RJJ39wPAPgIua6Qg&csuir=1&q=quickshell+how+to+make+screen+border+curve+like+in+https%3A%2F%2Fgithub.com%2Fcaelestia-dots%2Fshell%3Ftab%3Dreadme-ov-file&lns_mode=cvst&atvm=2&udm=50
import QtQuick
import Quickshell
import QtQuick.Shapes
import qs.theme

Shape {

    property color color: Colors.menu
    width: parent.width
    height: parent.height

    layer {
        enabled: true
        samples: 4
    }

        ShapePath {
        strokeWidth: 2
        strokeColor: "transparent"
        fillColor: color


        startX: 0
        startY: 0

        PathLine {
            x: width
            y: 0
        }

        PathQuad {
            x: width * 0.9
            y: height * 0.1

            controlX: width * 0.9
            controlY: height * 0.02
        }

        PathLine {
            x: width * 0.9
            y: height * 0.9
        }

        PathQuad {
            x: width * 0.8
            y: height

            controlX: width * 0.9
            controlY: height
        }

        PathLine {
            x: width * 0.2
            y: height
        }

        PathQuad {
            x: width * 0.1
            y: height * 0.9

            controlX: width * 0.1
            controlY: height
        }

        PathLine {
            x: width * 0.1
            y: height * 0.1
        }

        PathQuad {
            x: 0
            y: 0

            controlX: width * 0.1
            controlY: height * 0.02
        }
    }
}
