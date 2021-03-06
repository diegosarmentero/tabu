function round_start(){
    btnStart.visible = false;
    btnCorrect.visible = true;
    btnIncorrect.visible = true;
    btnNext.visible = false;
    timer.start();

    team1_playing = !team1_playing;
    if(team1_playing){
        title = _title_team1;
    }else{
        title = _title_team2;
    }
    shuffle_cards();
    change_card();
}

function round_end(){
    timer.stop();
    timerShow.color = "#4f4fd9";
    btnCorrect.visible = false;
    btnIncorrect.visible = false;
    btnNext.visible = true;
    seconds = 60;
    rounds -= 1;

    if(rounds == 0){
        endOfGame(team1Name, team1_points, team2Name, team2_points);
    }
}

function change_card(){
    if(_cardIndex >= root.model.length){
        shuffle_cards();
    }
    var words = root.model[_cardIndex];
    _cardIndex += 1;
    var words2 = root.model[_cardIndex];
    _cardIndex += 1;

    if(card1.z > card2.z){
        card1.x = -400;
        card1.opacity = 0;
        card2.mainWord = words[0];
        card2.relatedWord1 = words[1];
        card2.relatedWord2 = words[2];
        card2.relatedWord3 = words[3];
        card2.relatedWord4 = words[4];
        card2.relatedWord5 = words[5];
        card1.mainWord = words2[0];
        card1.relatedWord1 = words2[1];
        card1.relatedWord2 = words2[2];
        card1.relatedWord3 = words2[3];
        card1.relatedWord4 = words2[4];
        card1.relatedWord5 = words2[5];
    }else{
        card2.x = -400;
        card2.opacity = 0;
        card1.mainWord = words[0];
        card1.relatedWord1 = words[1];
        card1.relatedWord2 = words[2];
        card1.relatedWord3 = words[3];
        card1.relatedWord4 = words[4];
        card1.relatedWord5 = words[5];
        card2.mainWord = words2[0];
        card2.relatedWord1 = words2[1];
        card2.relatedWord2 = words2[2];
        card2.relatedWord3 = words2[3];
        card2.relatedWord4 = words2[4];
        card2.relatedWord5 = words2[5];
    }
}

function shuffle_cards(){
    _cardIndex = 0;
    var cardsDeck = model;
    root.model = cardsDeck;
    var words1 = root.model[_cardIndex];
    _cardIndex += 1;
    var words2 = root.model[_cardIndex];
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

function next_card(){
    if(_cardIndex >= root.model.length){
        shuffle_cards();
    }
    var words = root.model[_cardIndex];
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
