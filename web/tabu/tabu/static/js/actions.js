$("#form_batch").live("submit", function(event){
    event.preventDefault();
    $("#id_newlanguage").val("");
    $.post("/temp_rpc/", $("#form_batch").serializeArray()).done(card_created);
});

$("#form_card").live("submit", function(event){
    event.preventDefault();
    $("#id_newlanguage").val("");
    add_card();
});

$("#addNewLanguage").live("click", function(event){
    event.preventDefault();
    $("#id_newlanguage").val("");
    $("#hiddenNewLanguage").attr("style", "display: inline-block;");
    $("#languageCombo").attr("style", "display: none;");
    $("#dataCard").attr("style", "display: none;");
});

$("#createLanguage").live("click", function(event){
    event.preventDefault();
    create_language();
    $("#id_newlanguage").val("");
});

$("#cancelLanguage").live("click", function(event){
    event.preventDefault();
    $("#id_newlanguage").val("");
    $("#hiddenNewLanguage").attr("style", "display: none;");
    $("#languageCombo").attr("style", "display: inline-block;");
    $("#dataCard").attr("style", "display: inline-block;");
});


function validate_card()
{
    var w0 = $("#id_mainword").val();
    var w1 = $("#id_word1").val();
    var w2 = $("#id_word2").val();
    var w3 = $("#id_word3").val();
    var w4 = $("#id_word4").val();
    var w5 = $("#id_word5").val();
    if (w0.length == 0 || w1.length == 0 || w2.length == 0 || w3.length == 0 || w4.length == 0 || w5.length == 0)
    {
          return false;
    }
    return true;
}

function add_card(){
    if(validate_card()){
        $.pnotify({
            title: 'Card: ' + $("#id_mainword").val(),
            text: 'Creating card...'
        });
        $.post("/rpc/", $("#form_card").serializeArray()).done(card_created);
        $("#id_mainword").val("");
        $("#id_word1").val("");
        $("#id_word2").val("");
        $("#id_word3").val("");
        $("#id_word4").val("");
        $("#id_word5").val("");
        $("#id_mainword").focus();
    }else{
        $.pnotify({
            title: 'Invalid Card!',
            text: "All the fields must contain a value",
            type: 'error'
        });
    }
}

function card_created(data){
    if(!data['error']){
        $.pnotify({
            title: data["card"],
            text: 'Created!',
            type: 'success'
        });
    }else{
        $.pnotify({
            title: 'Error!',
            text: data['error'],
            type: 'error'
        });
    }
}

function create_language(){
    if($("#id_newlanguage").val().length > 0){
        $.pnotify({
            title: 'Language: ' + $("#id_newlanguage").val(),
            text: 'Creating language, please wait...'
        });
        $.post("/rpc/", $("#form_card").serializeArray()).done(language_added);
        $("#id_newlanguage").val("");
    }else{
        $.pnotify({
            title: 'Error!',
            text: "Language can not be empty",
            type: 'error'
        });
    }
}

function language_added(data){
    if(!data['error']){
        $.pnotify({
            title: data["language"],
            text: 'Created!',
            type: 'success'
        });
        var html = "<option value='" + data["language"] + "'\>" + data["language"] + "</option>";
        $(html).appendTo("#selectCombo");
    }else{
        $.pnotify({
            title: 'Error!',
            text: data['error'],
            type: 'error'
        });
    }
    $("#hiddenNewLanguage").attr("style", "display: none;");
    $("#languageCombo").attr("style", "display: inline-block;");
    $("#dataCard").attr("style", "display: inline-block;");
}