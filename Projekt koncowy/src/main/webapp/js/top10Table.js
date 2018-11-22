$(function(){

    var levelElement = $("#top10Level");
    var movesElement = $("#top10Moves");
    var timeElement = $("#top10Time");

    

    function postForm(level, greenRed){
        var form = $(
            "<form method='post' style='display: none;'>" +
                "<input type='text' name='top10Level' value='" + level + "'/>" +
                "<input type='text' name='greenRed' value='" + greenRed + "'/>" +
                "<input type='submit' id='clickMe'/>" +
            "</form>"
        );

        $("body").append(form);

        var clickMe = $("#clickMe");
        clickMe.click();
    }

});
