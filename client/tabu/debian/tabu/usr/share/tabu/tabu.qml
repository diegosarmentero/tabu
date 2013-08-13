import QtQuick 2.0
import Ubuntu.Components 0.1


MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"
    
    // Note! applicationName needs to match the .desktop filename
    applicationName: "tabu"
    
    /* 
     This property enables the application to change orientation 
     when the device is rotated. The default is false.
    */
    automaticOrientation: true
    
    width: units.gu(100)
    height: units.gu(75)
    
    StartPage{
        id: mainPage

        onStartGame: {
            playPage.shuffle_cards();
            playPage.team1_name = team1;
            playPage.team2_name = team2;
            playPage.rounds = rounds * players;
            startAnimation.running = true;
        }
    }

    WinnerPage {
        id: winnerPage
        opacity: 0
        visible: false
    }

    PlayPage{
        id: playPage
        opacity: 0
        visible: false

        onCurrentTeam: mainPage.title = name;

        onEndOfGame: {
            winnerPage.winner = name1;
            winnerPage.loser = name2;
            winnerPage.winnerPoints = points1;
            winnerPage.loserPoints = points2;
            winnerAnimation.running = true;
        }
    }

    SequentialAnimation{
        id: startAnimation
        PropertyAnimation { target: mainPage; property: "opacity"; to: 0; duration: 400 }
        PropertyAction { target: playPage; property: "visible"; value: true }
        PropertyAnimation { target: playPage; property: "opacity"; to: 1; duration: 400 }
    }

    SequentialAnimation{
        id: winnerAnimation
        PropertyAnimation { target: playPage; property: "opacity"; to: 0; duration: 400 }
        PropertyAction { target: winnerPage; property: "visible"; value: true }
        PropertyAnimation { target: winnerPage; property: "opacity"; to: 1; duration: 400 }
    }

}
