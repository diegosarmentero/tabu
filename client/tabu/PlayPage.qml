import QtQuick 2.0
import Ubuntu.Components 0.1
import "data.js" as Data

BasePage {
    id: pagePlay
    title: "Team:"

    property int seconds: 60
    property bool team1_playing: false
    property string team1_name: ""
    property string team2_name: ""
    property int team1_points: 0
    property int team2_points: 0
    property variant cards: null
    property int _cardIndex: 0

    property int rounds: 0

    signal currentTeam(string name)
    signal endOfGame(string name1, int points1, string name2, int points2)

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
                round_end();
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
        anchors.topMargin: units.gu(1)
        otherCard: card2

        onCardChanged: next_card();
    }

    Card {
        id: card2
        x: units.gu(2)
        anchors.top: parent.top
        anchors.topMargin: units.gu(1)
        otherCard: card1
        color: "#fff0dc"

        onCardChanged: next_card();
    }

    UbuntuShape {
        id: buttonsPlace
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: parent.width
        height: units.gu(9)

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
                change_card();
                add_point();
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

            onClicked: change_card();
        }

        Button {
            id: btnNext
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: units.gu(1)
            anchors.leftMargin: units.gu(1)
            width: (parent.width / 2) - units.gu(3)
            height: parent.height - units.gu(2)
            color: "#ff8700"

            visible: false

            Label {
                anchors.centerIn: parent
                fontSize: "x-large"
                text: "Next Player"
                color: "white"
                z: parent.z + 1
            }

            onClicked: round_start();
        }
        Button {
            id: btnStart
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: units.gu(1)
            anchors.rightMargin: units.gu(1)
            width: (parent.width / 2) - units.gu(3)
            height: parent.height - units.gu(2)
            color: "#00af64"
            Label {
                anchors.centerIn: parent
                fontSize: "x-large"
                text: "Start!"
                color: "white"
                z: parent.z + 1
            }

            onClicked: round_start();
        }
    }

    function round_start(){
        btnStart.visible = false;
        btnCorrect.visible = true;
        btnIncorrect.visible = true;
        btnNext.visible = false;
        timer.running = true;

        team1_playing = !team1_playing;
        if(team1_playing){
            currentTeam(team1_name);
            playPage.mainBackground = true;
        }else{
            currentTeam(team2_name);
            playPage.mainBackground = false;
        }
        change_card();

        rounds -= 1;
    }

    function round_end(){
        timer.running = false;
        timerShow.color = "#4f4fd9";
        btnCorrect.visible = false;
        btnIncorrect.visible = false;
        btnNext.visible = true;
        seconds = 60;

        if(rounds == 0){
            endOfGame(team1_name, team1_points, team2_name, team2_points);
        }
    }

    function change_card(){
        if(_cardIndex >= playPage.cards.length){
            _cardIndex = 0;
            shuffle_cards();
        }
//        var words = Data.shuffle(playPage.cards[_cardIndex]);
        var words = playPage.cards[_cardIndex];
        _cardIndex += 1;

        if(card1.z > card2.z){
            card1.x = -400;
            card1.opacity = 0;
            card1.mainWord = words[0];
            card1.relatedWord1 = words[1];
            card1.relatedWord2 = words[2];
            card1.relatedWord3 = words[3];
            card1.relatedWord4 = words[4];
            card1.relatedWord5 = words[5];
        }else{
            card2.x = -400;
            card2.opacity = 0;
            card2.mainWord = words[0];
            card2.relatedWord1 = words[1];
            card2.relatedWord2 = words[2];
            card2.relatedWord3 = words[3];
            card2.relatedWord4 = words[4];
            card2.relatedWord5 = words[5];
        }
    }

    function next_card(){
        if(_cardIndex >= playPage.cards.length){
            _cardIndex = 0;
            shuffle_cards();
        }
//        var words = Data.shuffle(playPage.cards[_cardIndex]);
        var words = playPage.cards[_cardIndex];
        _cardIndex += 1;

        if(card1.z > card2.z){
            card1.mainWord = words[0];
            card1.relatedWord1 = words[1];
            card1.relatedWord2 = words[2];
            card1.relatedWord3 = words[3];
            card1.relatedWord4 = words[4];
            card1.relatedWord5 = words[5];
        }else{
            card2.mainWord = words[0];
            card2.relatedWord1 = words[1];
            card2.relatedWord2 = words[2];
            card2.relatedWord3 = words[3];
            card2.relatedWord4 = words[4];
            card2.relatedWord5 = words[5];
        }
    }

    function add_point(){
        if(team1_playing){
            team1_points += 1;
        }else{
            team2_points += 1;
        }
    }

    function shuffle_cards(){
        var cardsDeck = Data.get_cards();
        playPage.cards = Data.shuffle(cardsDeck);
//        var words1 = Data.shuffle(playPage.cards[_cardIndex]);
        var words1 = playPage.cards[_cardIndex];
        _cardIndex += 1;
//        var words2 = Data.shuffle(playPage.cards[_cardIndex]);
        var words2 = playPage.cards[_cardIndex];
        _cardIndex += 1;
        card1.mainWord = words1[0];
        card1.relatedWord1 = words1[1];
        card1.relatedWord2 = words1[2];
        card1.relatedWord3 = words1[3];
        card1.relatedWord4 = words1[4];
        card1.relatedWord5 = words1[5];
        card2.mainWord = words2[0];
        card2.relatedWord1 = words2[1];
        card2.relatedWord2 = words2[2];
        card2.relatedWord3 = words2[3];
        card2.relatedWord4 = words2[4];
        card2.relatedWord5 = words2[5];
    }

}
