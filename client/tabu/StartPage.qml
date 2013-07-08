import QtQuick 2.0
import Ubuntu.Components 0.1

BasePage {
    title: "Tabu!"

    signal startGame(string team1, string team2, int players, int rounds)

    Column {
        spacing: units.gu(1)
        anchors {
            margins: units.gu(2)
            fill: parent
        }

        Label {
            id: lblTeam1
            text: "First Team Name:"
            fontSize: "large"
            color: "white"
        }
        TextField {
            id: txtTeam1
            width: parent.width
        }
        Label {
            id: lblTeam2
            text: "Second Team Name:"
            fontSize: "large"
            color: "white"
        }
        TextField {
            id: txtTeam2
            width: parent.width
        }
        Label {
            id: lblPlayers
            text: "Number of Players:"
            fontSize: "large"
            color: "white"
        }
        TextField {
            id: txtPlayers
            width: parent.width
        }
        Label {
            id: lblRounds
            text: "Number of Rounds:"
            fontSize: "large"
            color: "white"
        }
        TextField {
            id: txtRounds
            width: parent.width
        }
    }

    Button {
        width: parent.width - units.gu(16)
        height: units.gu(6)
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.bottomMargin: units.gu(4)
        anchors.leftMargin: units.gu(8)
        color: "#ff8700"

        text: "Start!"

        onClicked: {
            var name1 = txtTeam1.text
            var name2 = txtTeam2.text
            var players = parseInt(txtPlayers.text)
            var rounds = parseInt(txtRounds.text)
            startGame(name1, name2, players, rounds);
        }
    }
}
