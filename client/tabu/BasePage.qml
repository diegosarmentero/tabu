import QtQuick 2.0
import Ubuntu.Components 0.1

Page {

    property bool mainBackground: true

    onMainBackgroundChanged: {
        if(mainBackground){
            backcolor2.opacity = 0;
        }else{
            backcolor2.opacity = 1;
        }
    }

    Rectangle {
        id: backcolor
        anchors.fill: parent

//        Behavior on opacity { PropertyAnimation { duration: 200 } }
        gradient: Gradient {
             GradientStop { position: 0.0; color: "#4faaf0" }
             GradientStop { position: 0.5; color: "#106bb1" }
         }
    }

    Rectangle {
        id: backcolor2
        anchors.fill: parent
        opacity: 0

        Behavior on opacity { PropertyAnimation { duration: 200 } }
        gradient: Gradient {
             GradientStop { position: 0.0; color: "#62e200" }
             GradientStop { position: 0.6; color: "#007143" }
         }
    }
}
