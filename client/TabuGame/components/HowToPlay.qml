import QtQuick 2.0
import Ubuntu.Components 0.1

Base {
    id: root
    title: "<font color='#00aec8'>H</font><font color='#2f3934'>ow to Play?</font>"

    signal back

    body: Column {
        spacing: units.gu(6)

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            topMargin: units.gu(4)
            rightMargin: units.gu(6)
            leftMargin: units.gu(6)
        }

        Label {
            id: title
            text: i18n.tr("Taboo is a word guessing party game. The objective of the game is for a player to have his/her partner(s) guess the word on his/her card without using the word itself or five additional words listed on the card.")
            fontSize: "large"
            color: "#2f3934"
            anchors {
                left: parent.left
                right: parent.right
            }
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere

        }

        Label {
            id: rules_title
            text: i18n.tr("Rules:")
            fontSize: "x-large"
            color: "#00aec8"
            anchors {
                left: parent.left
                right: parent.right
            }
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere

        }

        Label {
            id: rules_description
            text: i18n.tr("An even number of players sit alternating around in a circle. Players take turns as the ''giver'', who attempts to prompt his or her teammates to guess as many keywords as possible in the allotted time. However, each card also has ''taboo'' (forbidden) words listed which may not be spoken. Should the giver say one, a ''censor'' on the opposing team hits the Incorrect Button and the giver must move on to the next word. For example, the giver might have to get his or her team to deduce the word ''baseball'' without offering the words ''sport,'' ''game,'' ''pastime'', ''hitter,'' ''pitcher'', or ''baseball'' itself as clues. The giver may not say a part of a ''taboo'' word; for example, using ''base'' in ''baseball'' is taboo. The giver may only use speech to prompt his or her teammates; gestures, sounds (e.g. barking), or drawings are not allowed. Singing is permitted, provided the singer is singing words rather than humming or whistling a tune. The giver's hints may not rhyme with a taboo word, or be an abbreviation of a taboo word.\n\nWhile the giver is prompting the teammates they may make as many guesses as they want with no penalties for wrong guesses. Once the team correctly guesses the word exactly as written on the card, the giver moves on to the next word, trying to get as many words as possible in the allotted time. When time runs out, play passes to the next adjacent player of the other team. The playing team receives one point for correct guesses.")
            fontSize: "large"
            color: "#2f3934"
            anchors {
                left: parent.left
                right: parent.right
            }

            wrapMode: Text.WrapAtWordBoundaryOrAnywhere

        }

        Button {
            text: i18n.tr("Back to Start")
            width: units.gu(30)
            color: "#00aec8"
            anchors {
                right: parent.right
            }

            onClicked: root.back()
        }
    }
}
