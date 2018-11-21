<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Game</title>
    <script src="../../js/jQuery3.3.1.js"></script>
    <script src="../../js/app.js"></script>
    <c:if test="${level == 1}"><script src="../../js/easyEnemy.js"></script></c:if>
    <c:if test="${level == 2}"><script src="../../js/mediumEnemy.js"></script></c:if>
    <c:if test="${level == 3}"><script src="../../js/hardEnemy.js"></script></c:if>

    <script>$(function(){$("table").remove();})</script>
    <link rel="stylesheet" type="text/css" href="../../css/game.css"/>
</head>
<body>

    <c:import url="header.jsp"/>

    <h2>Twoim zadaniem jest wciśnięcie wszystkich przycisków</h2>
    <ul>
        <li>Zielony oznacza wciśnięty</li>
        <li>jeden przycisk może wpływać na kilka przycisków</li>
        <li>Po prawej masz małpę która sprubuje cię prześcignąć</li>
        <li>Powodzenia! :)</li>

        <div id="timer">Czas gry: 00:00</div>
    </ul>

    <br/>

    <div id="game">
        Twoja gra:
        <div id="counter">Kliknięcia: 0</div>
        <div class="gameField">
            <c:forEach begin="1" var="i" end="3">
                <c:forEach begin="1" var="j" end="3">
                    <button class="buttonInGame">${((i - 1) * 3) + j}</button>
                </c:forEach>
                <br/>
            </c:forEach>
        </div>
    </div>

    <div id="enemyGame">
        Gra przeciwnika:
        <div id="enemyCounter">Kliknięcia: 0</div>
        <div class="gameField">
            <c:forEach begin="1" var="i" end="3">
                <c:forEach begin="1" var="j" end="3">
                    <button class="buttonInGame pseudoButton">${((i - 1) * 3) + j}</button>
                </c:forEach>
                <br/>
            </c:forEach>
        </div>
    </div>

    <table style="display: none;">
        <c:forEach var="i" items="${tab}">
            <tr>
                <c:forEach var="j" items="${i}">
                    <td>
                        ${j}
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>

</body>
</html>
