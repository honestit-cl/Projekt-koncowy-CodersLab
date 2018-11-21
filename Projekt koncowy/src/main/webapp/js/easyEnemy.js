$(function(){

    var enemyButtons = $("#enemyGame .buttonInGame");
    var enemyPushed = [];

    var trs = $("tr");

    var enemyClicks = 0;

    var pseudoClick = [];

    enemyButtons.each(function(index, element){
        enemyPushed.push(true);
        $(element).css("background-color", "green");
    });

    enemyButtons.each(function(index, element){

        var tr = trs.eq(index);
        var tds = tr.children();
        var len = tds.length;

        pseudoClick.push(function(){
            changeEnemyButton(index);
            for(var i = 0; i < len; i++){
                changeEnemyButton(parseInt(tds.eq(i).text()))
            }
        });

        pseudoClick[index]();//klikanie każdego, inaczej kodowanie gry :)
    });

    setInterval(enemyClick, 1000);

    //Takie tam funkcje

    function enemyClick(){
        var rand = parseInt(Math.random() * enemyButtons.length);
        incrementEnemyCounter();//zwiększenie licznika i wyświetlenie go na stronie
        pseudoClick[rand]();
        if(checkEnemyWinCondition()){
            redirectMain();
        }
    }

    function changeEnemyButton(index){
        if(enemyPushed[index] === true){
            enemyButtons.eq(index).css("background-color", "red");
            enemyPushed[index] = false;
        }else{
            enemyButtons.eq(index).css("background-color", "green");
            enemyPushed[index] = true;
        }
    }

    function checkEnemyWinCondition(){
        for(var i = 0; i < enemyPushed.length; i++){
            if(enemyPushed[i] === false){
                return false;
            }
        }
        return true;
    }

    function incrementEnemyCounter(){
        var div = $("#enemyCounter");
        enemyClicks++;
        div.text("Kliknięcia: " + enemyClicks);
    }

    function redirectMain(){
        var form = $(
            "<form action='/main' style='display: none;'>" +
            "<input type='submit' id='goToMain'/>" +
            "</form>"
        );
        $("body").append(form);

        var toClick = $("#goToMain");
        toClick.click();
    }

});
