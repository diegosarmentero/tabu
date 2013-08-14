import QtQuick 2.0
import Ubuntu.Components 0.1

Page {
    id: root
    visible: false

    property int keyboardSize: Qt.inputMethod.visible ? Qt.inputMethod.keyboardRectangle.height : 0
    property Component body

    Flickable {
        id: flick
        anchors.fill: parent
        clip: true
        contentHeight: column.height + root.keyboardSize

        Column {
            id: column
            objectName: "column"
            anchors {
                left: parent.left
                right: parent.right
            }
            height: childrenRect.height + units.gu(8)
            spacing: units.gu(3)

            Loader {
                id: loader
                anchors.left: parent.left
                anchors.right: parent.right
                sourceComponent: body ? body : undefined
            }
        }
    }
}
