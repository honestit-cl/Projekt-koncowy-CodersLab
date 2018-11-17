<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../css/form.css"/>
</head>
<body>

    <c:import url="header.jsp"/>

    <div class="formArea">
        <form:form method="post" modelAttribute="userEmailEditDto">

            <form:input path="email" placeholder="nowy email"/><br/>
            <form:errors path="email" cssClass="error"/>
            <c:if test="${email}"><span class="error">Ten email jest już zajęty</span></c:if>

            <form:password path="password" placeholder="haslo"/><br/>
            <form:errors path="password" cssClass="error"/>
            <c:if test="${password}"><span class="error">Nie właściwe hasło</span></c:if>

            <input type="submit" value="Zapisz"/>

            <c:if test="${success}"><span class="success">Zmieniono email</span></c:if>
        </form:form>
    </div>

</body>
</html>
