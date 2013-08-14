import QtQuick 2.0
import Ubuntu.Components 0.1
import "../js/server.js" as Server
import "../js/play_logic.js" as PlayLogic
import Ubuntu.Components.Popups 0.1

Page {
    id: root
    title: _title_team1
    visible: false

    property var model
    property int seconds: 60
    property bool team1_playing: false
    property int _cardIndex: 0
    property string _title_team1: "<font color='#00aec8'>T</font><font color='#2f3934'>abu Team: </font>" + team1Name
    property string _title_team2: "<font color='#00aec8'>T</font><font color='#2f3934'>abu Team: </font>" + team2Name

    property string team1Name: ""
    property string team2Name: ""
    property int team1_points: 0
    property int team2_points: 0
    property int players: 0
    property int rounds: 0
    property string language: ""

    signal back
    signal endOfGame(string team1, int points1, string team2, int points2)

    function callback(data) {
        rounds = rounds * players;
        root.model = data;

    }

    function get_cards() {
        PopupUtils.open(dialog);
        Server.get_cards(root.language, callback);
    }

    Component {
         id: dialog
         Dialog {
             id: dialogue
             title: i18n.tr("Loading Cards")
             text: i18n.tr("please wait...")
             ActivityIndicator {
                 running: !root.model ? true : false
                 width: parent.width

                 onRunningChanged: {
                     if(!running) {
                         PopupUtils.close(dialogue);
                     }
                 }
             }

             Button {
                 text: i18n.tr("Cancel Game")
                 color: UbuntuColors.orange
                 onClicked: {
                     PopupUtils.close(dialogue);
                     root.back();
                 }
             }
         }
    }

    Rectangle {
        anchors.fill: parent
        color: team1_playing ? "white" : "#333333"

        Behavior on color { ColorAnimation { duration: 300 } }
    }

    Timer {
        id: timer
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            seconds = seconds - 1;
            if(seconds == 10){
                timerShow.color = "#e7003e";
            }else if(seconds == -1){
                PlayLogic.round_end();
                return;
            }
        }
    }

    UbuntuShape {
        id: timerShow
        width: units.gu(10)
        height: units.gu(10)
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: units.gu(1)
        anchors.rightMargin: units.gu(1)
        color: "#4f4fd9"

        Label {
            id: lblTime

            text: seconds
            color: "white"
            anchors.centerIn: parent
            font.pixelSize: units.gu(1) * 8
        }
    }

    Card {
        id: card1
        x: units.gu(2)
        anchors.top: parent.top
        anchors.topMargin: units.gu(2)
        width: root.width - units.gu(6) - timerShow.width
        height: root.height - units.gu(14)
        rightXmargin: root.width
        otherCard: card2

        onCardChanged: PlayLogic.next_card();
    }

    Card {
        id: card2
        x: units.gu(2)
        anchors.top: parent.top
        anchors.topMargin: units.gu(2)
        width: root.width - units.gu(6) - timerShow.width
        height: root.height - units.gu(14)
        rightXmargin: root.width
        otherCard: card1

        onCardChanged: PlayLogic.next_card();
    }

    UbuntuShape {
        id: buttonsPlace
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: units.gu(9)
        color: team1_playing ? "#333333" : "white"

        Behavior on color { ColorAnimation { duration: 300 } }

        Button {
            id: btnCorrect
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: units.gu(1)
            anchors.rightMargin: units.gu(1)
            width: (parent.width / 2) - units.gu(3)
            height: parent.height - units.gu(2)
            color: "#00af64"
            visible: false
            Label {
                anchors.centerIn: parent
                fontSize: "x-large"
                text: "Correct :)"
                color: "white"
                z: parent.z + 1
            }

            onClicked: {
                PlayLogic.change_card();
                PlayLogic.add_point();
            }

        }
        Button {
            id: btnIncorrect
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: units.gu(1)
            anchors.leftMargin: units.gu(1)
            width: (parent.width / 2) - units.gu(3)
            height: parent.height - units.gu(2)
            color: "#f30021"
            visible: false
            Label {
                anchors.centerIn: parent
                fontSize: "x-large"
                text: "Incorrect :("
                color: "white"
                z: parent.z + 1
            }

            onClicked: PlayLogic.change_card();
        }

        Button {
            id: btnNext
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: units.gu(1)
            anchors.leftMargin: units.gu(1)
            width: (parent.width / 2) - units.gu(3)
            height: parent.height - units.gu(2)
            color: UbuntuColors.orange

            visible: false

            Label {
                anchors.centerIn: parent
                fontSize: "x-large"
                text: "Next Player"
                color: "white"
                z: parent.z + 1
            }

            onClicked: PlayLogic.round_start();
        }
        Button {
            id: btnStart
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: units.gu(1)
            anchors.rightMargin: units.gu(1)
            width: (parent.width / 2) - units.gu(3)
            height: parent.height - units.gu(2)
            color: "#00aec8"
            Label {
                anchors.centerIn: parent
                fontSize: "x-large"
                text: "Start!"
                color: "white"
                z: parent.z + 1
            }

            onClicked: PlayLogic.round_start();
        }
    }
}
