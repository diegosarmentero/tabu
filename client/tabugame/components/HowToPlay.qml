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
            text: i18n.tr("Tabu is a word guessing party game. The objective of the game is for a player to have his/her partner(s) guess the word on his/her card without using the word itself or five additional words listed on the card.")
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
            text: i18n.tr("1) Divide the players into two teams.")
            fontSize: "large"
            color: "#2f3934"
            anchors {
                left: parent.left
                right: parent.right
            }
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }

        Label {
            text: i18n.tr("2) Choose one person from a team to be the first clue giver. She/He sits opposite of their team and start the round of Tabu, flipping the cards when necessary. The card should be hidden from their team but visible to at least one of her/his opponents. That opponent should pay attention to press Incorrect when one of the forbidden words is mentioned.")
            fontSize: "large"
            color: "#2f3934"
            anchors {
                left: parent.left
                right: parent.right
            }
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }

        Label {
            text: i18n.tr("3) Give verbal clues to your teammates to help them guess the word placed at the top of the card. Your clues can be sentences or single words. Do not use the words that are shown on the Tabu list on the card. The list on the card contains a number of words or terms that are considered \"tabu/taboo,\" and therefore cannot be said aloud by the clue giver. The listed words, and any parts or forms of them, are forbidden as clues. For instance, you cannot say the words \"baby\" or \"sitter\" if the word \"babysitter\" is listed. You also cannot say \"work\" if one of the words listed is \"work\".")
            fontSize: "large"
            color: "#2f3934"
            anchors {
                left: parent.left
                right: parent.right
            }
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }

        Label {
            text: i18n.tr("4) Score one point for the clue giver's team for each word they guess correctly, pressing \"Correct\". There is no penalty for wrong answers.")
            fontSize: "large"
            color: "#2f3934"
            anchors {
                left: parent.left
                right: parent.right
            }
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }

        Label {
            text: i18n.tr("5) You can flip the card and move on to the next Card if you want.")
            fontSize: "large"
            color: "#2f3934"
            anchors {
                left: parent.left
                right: parent.right
            }
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }

        Label {
            text: i18n.tr("6) Press the \"Incorrect\" button if you hear the clue giver use the Tabu word, or any of the related ones. If this happens, the clue giver must move on to another word. The clue giver may continue giving clues until the time (one minute) expires. The team with the biggest number of words guessed at the end of all the rounds wins.")
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
