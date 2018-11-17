<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="../../css/form.css"/>
</head>
<body>
    <%
        request.setAttribute("inLogin", true);
    %>
    <c:import url="header.jsp"/>

    <div class="formArea">
        <form:form method="post" modelAttribute="userLoginDto">
            <form:input path="name" placeholder="name"/><br/>
            <form:password path="password" placeholder="password"/><br/>

            <input type="submit" value="Zaloguj się"/><br/>
            <c:if test="${emptyField}"><span class="error">Wszystkie pola wymagane</span></c:if>
            <c:if test="${wrongData}"><span class="error">Niewłąściwy login lub hasło</span></c:if>

            <c:if test="${success}"><span class="success">Witam ${user.name}</span><br/></c:if>
        </form:form>
    </div>

</body>
</html>
