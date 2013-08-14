.pragma library

function get_languages(callback) {
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
        if (doc.readyState == XMLHttpRequest.DONE) {
            var result = JSON.parse(doc.responseText);
            callback(result);
        }
    }
    var url = "http://tabugame.ninjaide.webfactional.com/get_languages/";
    doc.open("get", url);
    doc.setRequestHeader("Content-Encoding", "UTF-8");
    doc.send();
}

function get_cards(language, callback) {
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
        if (doc.readyState == XMLHttpRequest.DONE) {
            var result = JSON.parse(doc.responseText);
            callback(result);
        }
    }
    var url = "http://tabugame.ninjaide.webfactional.com/get_cards/?language=" + language;
    doc.open("get", url);
    doc.setRequestHeader("Content-Encoding", "UTF-8");
    doc.send();
}
