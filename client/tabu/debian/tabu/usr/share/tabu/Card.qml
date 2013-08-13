import QtQuick 2.0
import Ubuntu.Components 0.1

UbuntuShape {
    id: card
    width: parent.width - units.gu(6) - timerShow.width
    height: parent.height - units.gu(14)
    color: "white"
//    image: Image {
//        source: "./notepaper.jpg"
//        anchors.fill: parent
//        anchors.centerIn: parent
//        fillMode: Image.PreserveAspectFit
//    }

    property variant otherCard: null
    property alias mainWord: _mainWord.text
    property alias relatedWord1: _relatedWord1.text
    property alias relatedWord2: _relatedWord2.text
    property alias relatedWord3: _relatedWord3.text
    property alias relatedWord4: _relatedWord4.text
    property alias relatedWord5: _relatedWord5.text

    signal cardChanged;

    Behavior on x {
        SequentialAnimation{
            PropertyAnimation { duration: 200 }
            PropertyAction { target: card; property: "x"; value: units.gu(2) }
        }
    }

    Behavior on opacity {
        SequentialAnimation{
            PropertyAnimation { duration: 200 }
            PropertyAction { target: otherCard; property: "z"; value: card.z + 1 }
            PropertyAnimation { duration: 200; to: 1 }
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        drag.target: card
        drag.axis: Drag.XAxis

        onReleased: {
            if(card.x < (units.gu(3) - (card.width / 2))){
                card.x = 0 - card.width;
                card.opacity = 0;
                cardChanged();
            }else if(card.x < (pagePlay.width / 2)){
                card.x = units.gu(2);            }
            else if(card.x > (card.width / 2)){
                card.x = pagePlay.width;
                card.opacity = 0;
                cardChanged();
            }
        }

    }

    Column {
        spacing: units.gu(4)
        anchors.centerIn: parent
        anchors.margins: units.gu(4)

        Label {
            id: _mainWord
            fontSize: "x-large"
            text: "Palabra Principal"
            wrapMode: Text.WordWrap
            width: card.width
            horizontalAlignment: Text.AlignHCenter
        }
        Label {
            id: _relatedWord1
            fontSize: "large"
            text: "Related Word 1"
            wrapMode: Text.WordWrap
            width: card.width
            horizontalAlignment: Text.AlignHCenter
        }
        Label {
            id: _relatedWord2
            fontSize: "large"
            text: "Related Word 1"
            wrapMode: Text.WordWrap
            width: card.width
            horizontalAlignment: Text.AlignHCenter
        }
        Label {
            id: _relatedWord3
            fontSize: "large"
            text: "Related Word 1"
            wrapMode: Text.WordWrap
            width: card.width
            horizontalAlignment: Text.AlignHCenter
        }
        Label {
            id: _relatedWord4
            fontSize: "large"
            text: "Related Word 1"
            wrapMode: Text.WordWrap
            width: card.width
            horizontalAlignment: Text.AlignHCenter
        }
        Label {
            id: _relatedWord5
            fontSize: "large"
            text: "Related Word 1"
            wrapMode: Text.WordWrap
            width: card.width
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
