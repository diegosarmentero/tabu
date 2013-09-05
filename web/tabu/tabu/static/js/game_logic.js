var team1;
var team2;
var players;
var rounds;
var time;
var timerId;

var rounds_played = 1;
var team1_playing = true;
var team1_points = 0;
var team2_points = 0;

var index = 0;

function change_card(){
    $($("#cardholder").children('.ui-block-a')[index]).attr("style", "display: none;");
    index++;
    if(index > $("#cardholder").children('.ui-block-a').length - 1) {
        index = 0;
    }
    $($("#cardholder").children('.ui-block-a')[index]).attr("style", "display: inline;");
}

function card_correct() {
    if(team1_playing){
        team1_points += 1;
        $("#current_score").html("Score: " + team1_points);
    }else{
        team2_points += 1;
        $("#current_score").html("Score: " + team2_points);
    }
    change_card();
}

function end_round() {
    $("#round_nro").html(parseInt(rounds_played / players) + " / " + (rounds / players));
    if(team1_playing){
        $("#teamname").html("Team: " + team2);
        $("#teamnameRound").html("Team: " + team2);
        $("#current_score").html("Score: " + team2_points);
        team1_playing = false;
    } else {
        $("#teamname").html("Team: " + team1);
        $("#teamnameRound").html("Team: " + team1);
        $("#current_score").html("Score: " + team1_points);
        team1_playing = true;
    }
    if(rounds_played == rounds) {
        $("#team1_total").html("Total: " + team1_points)
        $("#team2_total").html("Total: " + team2_points)
        location.hash = "#round-end";
    } else {
        location.hash = "#ready";
    }
    rounds_played += 1;
}

function start_round() {
    timerId = setInterval("time_progress()", 1000);
    location.hash = "#round";
}

function time_progress(){
    time--;
    if(time < 0){
        time = 60;
        window.clearInterval(timerId);
        end_round();
    }else{
        $("#timer").html("Time: " + time);
    }
}

function reset_game() {
    rounds_played = 1;
    team1_playing = true;
    team1_points = 0;
    team2_points = 0;
    $("#teamname").html("Team: " + team1);
    $("#teamnameRound").html("Team: " + team1);
    $("#current_score").html("Score: " + team1_points);
    location.hash = "#ready";
}