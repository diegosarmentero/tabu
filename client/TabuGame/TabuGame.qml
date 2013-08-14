import QtQuick 2.0
import Ubuntu.Components 0.1
import "components"


MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "Tabu Party Game!"
    
    // Note! applicationName needs to match the .desktop filename
    applicationName: "TabuGame"
    
    /* 
     This property enables the application to change orientation 
     when the device is rotated. The default is false.
    */
    automaticOrientation: true
    backgroundColor: "white"
    
    width: units.gu(100)
    height: units.gu(75)
    

    PageStack {
        id: stack

        Component.onCompleted: push(start)

        Start {
            id: start

            onHowToPlay: stack.push(howto);

            onPlay: stack.push(setup)
        }

        HowToPlay {
            id: howto

            onBack: stack.push(start);
        }

        SetupGame {
            id: setup

            onBack: stack.push(start);
            onPlay: {
                play.team1Name = team1;
                play.team2Name = team2;
                play.players = players;
                play.rounds = rounds;
                play.language = lang;
                stack.push(play);
                play.start_game();
            }
        }

        Play {
            id: play

            onBack: stack.push(start);

            onExit: stack.push(start);

            onNoCardsFound: stack.push(setup);

            onEndOfGame: {
                if(points1 > points2) {
                    winner.winner = team1;
                    winner.winnerPoints = points1;
                    winner.loser = team2;
                    winner.loserPoints = points2;
                } else {
                    winner.winner = team2;
                    winner.winnerPoints = points2;
                    winner.loser = team1;
                    winner.loserPoints = points1;
                }
                stack.push(winner);
            }
        }

        Winner {
            id: winner

            onStart: stack.push(start);
        }
    }
}
