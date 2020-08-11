<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Для тестов</title>
</head>
<body>
    <c:out value="5 * 5"/>
    <br>
    <c:out value="${5 * 5}"/>
    <br>
    <c:out value="${null}"/>
    <br>
    <c:out value="${null}" default="значение не определено"/>
    <br>
    <c:out value="<b>Это пример на <c:out> c escapeXml='true'</b>"/>
    <br>
    <c:out value="<b>Это пример на <c:out> c escapeXml='false'" escapeXml="false"/>
    <br>

    <c:set var="schoolName" scope="application" value="Progwards" />
    <% application.setAttribute("schoolName", "Progwards Progwards Progwards"); %>
    schoolName = ${schoolName}
    <br>
    <c:remove var="schoolName"/>
    schoolName = ${schoolName}
    <br>
</body>
</html>