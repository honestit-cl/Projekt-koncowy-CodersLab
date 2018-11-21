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

    var randomCounter = 30;
    var reverseTab = [0,1,2,3,4,5,6,7,8];
    setInterval(enemyClick, 1000);

    //Takie tam funkcje

    function enemyClick(){
        incrementEnemyCounter();
        if(randomCounter > 0){
            var rand = parseInt(Math.random() * enemyButtons.length);
            pseudoClick[rand]();
            reverseTab.push(rand);
            randomCounter--;
        }else{
            pseudoClick[reverseTab[0]]();
            reverseTab.shift();
        }
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
