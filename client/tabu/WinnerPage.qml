import QtQuick 2.0
import Ubuntu.Components 0.1

BasePage {
    id: pageWinner
    anchors.fill: parent

    property alias winner: lblWinner.text
    property alias loser: lblSecond.text
    property alias winnerPoints: lblPoints.text
    property alias loserPoints: lblSecondPoints.text

    UbuntuShape {
        anchors.centerIn: parent
        anchors.margins: units.gu(8)
        width: parent.width - units.gu(2)
        height: parent.height - units.gu(2)

        Column {
            spacing: units.gu(4)
            anchors.centerIn: parent
            Label {
                text: "And the Winner is:"
                fontSize: "large"
                width: pageWinner.width
                horizontalAlignment: Text.AlignHCenter
                color: "white"
            }
            Label {
                id: lblWinner
                text: ""
                fontSize: "x-large"
                width: pageWinner.width
                horizontalAlignment: Text.AlignHCenter
                color: "white"
            }
            Label {
                id: lblPoints
                text: ""
                fontSize: "x-large"
                width: pageWinner.width
                horizontalAlignment: Text.AlignHCenter
                color: "white"
            }
            Label {
                text: "--------------------------"
                fontSize: "x-large"
                width: pageWinner.width
                horizontalAlignment: Text.AlignHCenter
                color: "white"
            }
            Label {
                id: lblSecond
                text: ""
                fontSize: "large"
                width: pageWinner.width
                horizontalAlignment: Text.AlignHCenter
                color: "white"
            }
            Label {
                id: lblSecondPoints
                text: ""
                fontSize: "medium"
                width: pageWinner.width
                horizontalAlignment: Text.AlignHCenter
                color: "white"
            }
        }
    }
}
