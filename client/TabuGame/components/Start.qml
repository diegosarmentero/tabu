import QtQuick 2.0
import Ubuntu.Components 0.1

Base {
    id: root
    title: "<font color='#00aec8'>T</font><font color='#2f3934'>abu Party Game</font>"

    signal play
    signal howToPlay

    Label {
        id: title
        text: i18n.tr("Incredible fun Party Game! Compete with your friends to find out the secret <b>word</b> without saying it and help your team to win!")
        fontSize: "large"
        color: "#2f3934"
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            margins: units.gu(4)
            topMargin: units.gu(16)
        }
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere

    }

    Column {
        anchors.centerIn: parent
        spacing: units.gu(3)

        Button {
            text: i18n.tr("Play Now!")
            width: units.gu(30)
            color: "#00aec8"

            onClicked: root.play()
        }

        Button {
            text: i18n.tr("How to Play?")
            width: units.gu(30)
            color: "#00aec8"

            onClicked: root.howToPlay()
        }
    }
}
