import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem

Base {
    id: root
    visible: false

    title: "<font color='#00aec8'>A</font><font color='#2f3934'>nd the Winner is...</font>"

    property string winner: ""
    property string loser: ""
    property string winnerPoints: ""
    property string loserPoints: ""

    signal start

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

        UbuntuShape {
            height: column.height + units.gu(4)
            width: parent.width
            radius: "medium"
            color: "#2f3934"

            Column {
                id: column
                spacing: units.gu(4)
                anchors {
                    left: parent.left
                    right: parent.right
                }

                Label {
                    text: i18n.tr("And the Winner is:")
                    fontSize: "x-large"
                    color: "#00aec8"
                    anchors {
                        left: parent.left
                        right: parent.right
                    }

                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                }
                Row {
                    id: row1
                    spacing: units.gu(2)
                    anchors {
                        left: parent.left
                        right: parent.right
                        margins: units.gu(4)
                    }

                    UbuntuShape {
                        id: icon1
                        image: Image {
                            source: "../img/victory.jpg"
                            fillMode: Image.PreserveAspectFit
                        }
                        width: units.gu(14)
                        height: units.gu(14)
                    }

                    Column {
                        spacing: units.gu(2)
                        width: row1.width - icon1.width - row1.spacing - row1.anchors.margins

                        Label {
                            id: lblWinner
                            text: root.winner
                            fontSize: "x-large"
                            font.bold: true
                            anchors {
                                left: parent.left
                                right: parent.right
                            }
                            horizontalAlignment: Text.AlignHCenter
                            opacity: .9
                            style: Text.Raised
                            styleColor: "black"
                            color: "white"
                            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                        }
                        Label {
                            id: lblPoints
                            text: root.winnerPoints
                            fontSize: "x-large"
                            anchors {
                                left: parent.left
                                right: parent.right
                            }
                            horizontalAlignment: Text.AlignHCenter
                            opacity: .9
                            style: Text.Raised
                            styleColor: "black"
                            color: "white"
                        }
                    }
                }
                ListItem.ThinDivider {
                    id: divider
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                }
                Label {
                    text: i18n.tr("And the Loser is:")
                    fontSize: "x-large"
                    color: "#00aec8"
                    anchors {
                        left: parent.left
                        right: parent.right
                    }

                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                }
                Row {
                    id: row2
                    spacing: units.gu(2)
                    anchors {
                        left: parent.left
                        right: parent.right
                        margins: units.gu(4)
                    }

                    UbuntuShape {
                        id: icon2
                        image: Image {
                            source: "../img/loser.jpg"
                            fillMode: Image.PreserveAspectFit
                        }
                        width: units.gu(14)
                        height: units.gu(14)
                    }

                    Column {
                        spacing: units.gu(2)
                        width: row2.width - icon2.width - row2.spacing - row2.anchors.margins
                        Label {
                            id: lblSecond
                            text: root.loser
                            font.bold: true
                            fontSize: "x-large"
                            anchors {
                                left: parent.left
                                right: parent.right
                            }
                            horizontalAlignment: Text.AlignHCenter
                            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                            color: "white"
                        }
                        Label {
                            id: lblSecondPoints
                            text: root.loserPoints
                            fontSize: "x-large"
                            anchors {
                                left: parent.left
                                right: parent.right
                            }
                            horizontalAlignment: Text.AlignHCenter
                            color: "white"
                        }
                    }
                }
            }
        }

        Button {
            text: i18n.tr("Back to Start")
            width: units.gu(30)
            color: "#00aec8"
            anchors {
                right: parent.right
            }

            onClicked: root.start()
        }
    }
}
