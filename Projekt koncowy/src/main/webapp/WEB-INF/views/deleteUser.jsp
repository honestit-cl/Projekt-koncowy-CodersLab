<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../css/form.css"/>
</head>
<body>

    <c:import url="header.jsp"/>

    <div class="formArea">
        <form:form method="post" modelAttribute="userDeleteDto">

            <form:password path="password" placeholder="wpisz haslo by usunac konto"/><br/>
            <form:errors path="password" cssClass="error"/>
            <c:if test="${password}"><span class="error">Błędna hasło</span></c:if>

            <input type="submit" value="Usun konto"/>

        </form:form>
    </div>

</body>
</html>
