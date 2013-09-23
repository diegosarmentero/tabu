import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.Popups 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem
import "../js/server.js" as Server

Base {
    id: root
    title: "<font color='#00aec8'>S</font><font color='#2f3934'>etup Game</font>"

    signal back
    signal play(string team1, string team2, int players, int rounds, string lang)

    property string selectedLanguage: ""
    property var model

    function callback(data){
        root.model = data;
        root.selectedLanguage = root.model[0];
    }

    Component.onCompleted: Server.get_languages(callback);

    Component {
        id: popoverFriends

        Popover {
            id: popover
            Rectangle {
                anchors.fill: parent
                color: "#ededed"
            }

            Column {
                anchors {
                    left: parent.left
                    top: parent.top
                    right: parent.right
                    topMargin: units.gu(2)
                }
                spacing: units.gu(2)

                Label {
                    id: label_message
                    anchors {
                        left: parent.left
                        right: parent.right
                        margins: units.gu(2)
                    }
                    text: i18n.tr("Choose a Language to Play")
                    font.bold: true
                    color: UbuntuColors.orange
                    fontSize: "large"
                    opacity: .9
                    style: Text.Raised
                    styleColor: "black"
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                }

                ListView {
                    height: root.height - label_message.height
                    anchors {
                        left: parent.left
                        right: parent.right
                        leftMargin: units.gu(2)
                    }

                    clip: true

                    model: root.model
                    delegate: ListItem.Standard {
                        id: listAll
                        progression: true
                        Label {
                            id: label_lang
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
                            text: modelData
                            color: "black"
                            elide: Text.ElideRight
                        }

                        onClicked: {
                            root.selectedLanguage = label_lang.text;
                            popover.hide();
                        }
                    }
                }
            }
        }
    }

    body: Column {
        id: col
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
            text: i18n.tr("Create Teams and choose number of Rounds")
            color: "#2f3934"
            fontSize: "large"
            smooth: true
            width: parent.width
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }
        Label {
            id: error_message
            text: i18n.tr("<b>Some fields contains invalid values</b>")
            visible: false
            color: "red"
            fontSize: "medium"
            smooth: true
            width: parent.width
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }

        UbuntuShape {
            id: login_background
            color: "#333333"
            height: col_login.height + units.gu(4)
            width: parent.width

            Column {
                id: col_login
                spacing: units.gu(2)
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                    topMargin: units.gu(2)
                    leftMargin: units.gu(2)
                    rightMargin: units.gu(2)
                }

                Label {
                    text: i18n.tr("First Team Name:")
                    fontSize: "large"
                    color: Theme.palette.normal.baseText
                    opacity: .6
                    style: Text.Raised
                    styleColor: "black"
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                }

                TextField {
                    id: txtTeam1
                    width: col_login.width
                    hasClearButton: true
                    placeholderText: "First Team Name"
                }

                Label {
                    text: i18n.tr("Second Team Name:")
                    fontSize: "large"
                    color: Theme.palette.normal.baseText
                    opacity: .6
                    style: Text.Raised
                    styleColor: "black"
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                }

                TextField {
                    id: txtTeam2
                    width: col_login.width
                    hasClearButton: true
                    placeholderText: "Second Team Name"
                }

                Label {
                    text: i18n.tr("Number of Players per Team:")
                    anchors {
                        left: parent.left
                        right: parent.right
                    }

                    fontSize: "large"
                    color: Theme.palette.normal.baseText
                    opacity: .6
                    style: Text.Raised
                    styleColor: "black"
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                }

                TextField {
                    id: txtPlayers
                    width: col_login.width
                    hasClearButton: true
                    placeholderText: "Number of Players"
                    validator: IntValidator{bottom: 2}
                }

                Label {
                    text: i18n.tr("Number of Rounds:")
                    fontSize: "large"
                    color: Theme.palette.normal.baseText
                    opacity: .6
                    style: Text.Raised
                    styleColor: "black"
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                }

                TextField {
                    id: txtRounds
                    width: col_login.width
                    hasClearButton: true
                    placeholderText: "Number of Rounds"
                    validator: IntValidator{bottom: 2}
                }

                Label {
                    text: i18n.tr("Language:")
                    fontSize: "large"
                    color: Theme.palette.normal.baseText
                    opacity: .6
                    style: Text.Raised
                    styleColor: "black"
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                }

                Row {
                    spacing: units.gu(2)

                    Button {
                        id: buttonLanguage
                        text: root.selectedLanguage
                        color: "#00aec8"
                        width: units.gu(15)

                        onClicked: {
                            PopupUtils.open(popoverFriends, root);
                        }
                    }

                    ActivityIndicator {
                        id: activity
                        running: buttonLanguage.text ? true : false
                        visible: buttonLanguage.text ? false : true
                    }

                    Label {
                        text: i18n.tr("Loading languages...")
                        visible: buttonLanguage.text ? false : true
                    }
                }

                Row {
                    spacing: units.gu(1)
                    anchors {
                        left: parent.left
                        right: parent.right
                    }

                    Button {
                        id: buttonBack
                        text: i18n.tr("Back")
                        color: "#00aec8"
                        width: (parent.width / 2) - units.gu(1)

                        onClicked: {
                            error_message.visible = false;
                            root.back();
                        }
                    }

                    Button {
                        id: button2
                        text: i18n.tr("Play!")
                        color: "#00aec8"
                        width: (parent.width / 2) - units.gu(1)

                        onClicked: {
                            var team1 = txtTeam1.text;
                            var team2 = txtTeam2.text;
                            var rounds = txtRounds.text;
                            var players = txtPlayers.text;
                            if(team1 && team2 && rounds && players && root.selectedLanguage){
                                error_message.visible = false;
                                root.play(team1, team2, players, rounds, root.selectedLanguage);
                            } else {
                                error_message.visible = true;
                            }
                        }
                    }
                }
            }
        }
    }
}
