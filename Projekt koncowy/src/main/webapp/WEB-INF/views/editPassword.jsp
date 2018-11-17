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
        <form:form method="post" modelAttribute="userEditPasswordDto">

            <form:password path="newPassword" placeholder="new password"/><br/>
            <form:errors path="newPassword" cssClass="error"/>

            <form:password path="confirmNewPassword" placeholder="repeat new password"/><br/>
            <form:errors path="confirmNewPassword" cssClass="error"/>
            <c:if test="${differentPassword}"><span class="error">Różne hasła</span></c:if>

            <form:password path="oldPassword" placeholder="confirm with old password"/><br/>
            <form:errors path="oldPassword" cssClass="error"/>
            <c:if test="${wrongPassword}"><span class="error">Błędne hasło</span></c:if>

            <input type="submit" value="zmień hasło"/>
            <c:if test="$success"><span class="success">Zmieniono hasło</span></c:if>

        </form:form>
    </div>

</body>
</html>
