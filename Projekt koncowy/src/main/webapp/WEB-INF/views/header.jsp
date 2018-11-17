<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" type="text/css" href="../../css/fontello-972fff05/css/fontello.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/header.css"/>
    <style>
        /*ustawienia body dołączone do każdego widoku*/
        body{
            text-align: center;
            background-color: #55321a;
        }
    </style>
</head>
<body>
    <%
        if(session.getAttribute("user") != null){
            request.setAttribute("logged", true);
        }else{
            request.setAttribute("logged", false);
        }
    %>
    <header>
        <c:if test="${logged}">
            <h3>Idź do tablicy:</h3>
            <c:forEach var="i" begin="2" end="5">
                <a href="/game?level=${i}">${i}x${i}</a>
            </c:forEach>

            <a id="logoutLink" href="/logout">Wyloguj się</a>
            <a id="user" href="/user"><i class="icon-user-5"></i></a>
        </c:if>
        <c:if test="${!logged}">
            <c:if test="${inRegister}"><a id="loginLink" href="/login">Zaloguj się!</a></c:if>
            <c:if test="${inLogin}"><a id="registerLink" href="/register">Zarejestruj się!</a></c:if>
        </c:if>
    </header>
</body>
</html>
