import QtQuick 2.0
import Ubuntu.Components 0.1

UbuntuShape {
    id: card

    color: "#00aec8"
    radius: "medium"

    property int rightXmargin: 0
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

    UbuntuShape {
        id: img
        color: "#33363b"
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: parent.bottom
            margins: units.gu(1)
        }
        image: Image {
            asynchronous: true
            source: "../img/notepaper.jpg"
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
            }else if(card.x < (card.rightXmargin / 2)){
                card.x = units.gu(2);            }
            else if(card.x > (card.width / 2)){
                card.x = card.rightXmargin;
                card.opacity = 0;
                cardChanged();
            }
        }
    }

    Column {
        spacing: units.gu(3)
        anchors.centerIn: parent
        anchors.margins: units.gu(4)

        Label {
            id: _mainWord
            fontSize: "x-large"
            text: ""
            wrapMode: Text.WordWrap
            width: card.width
            horizontalAlignment: Text.AlignHCenter
        }
        Label {
            id: _relatedWord1
            fontSize: "large"
            text: ""
            wrapMode: Text.WordWrap
            width: card.width
            horizontalAlignment: Text.AlignHCenter
        }
        Label {
            id: _relatedWord2
            fontSize: "large"
            text: ""
            wrapMode: Text.WordWrap
            width: card.width
            horizontalAlignment: Text.AlignHCenter
        }
        Label {
            id: _relatedWord3
            fontSize: "large"
            text: ""
            wrapMode: Text.WordWrap
            width: card.width
            horizontalAlignment: Text.AlignHCenter
        }
        Label {
            id: _relatedWord4
            fontSize: "large"
            text: ""
            wrapMode: Text.WordWrap
            width: card.width
            horizontalAlignment: Text.AlignHCenter
        }
        Label {
            id: _relatedWord5
            fontSize: "large"
            text: ""
            wrapMode: Text.WordWrap
            width: card.width
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
