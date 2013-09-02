var index = 0;

function change_card(){
    $($("#cardholder").children('.ui-block-a')[index]).attr("style", "display: none;");
    index++;
    if(index > $("#cardholder").children('.ui-block-a').length - 1) {
        index = 0;
    }
    $($("#cardholder").children('.ui-block-a')[index]).attr("style", "display: inline;");
}