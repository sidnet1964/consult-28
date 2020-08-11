<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Для тестов</title>
</head>
<body>

<c:if test="${5 > 1}" var="ifResult">
    Число 5 > 1
</c:if>

<c:out value="${ifResult}" />

<c:set var="result" scope="session" value="${23400*2}"/>
<c:if test="${result > 45000}">
    <p>Result = <c:out value="${result}"/><p>
</c:if>

<c:set var="alter" scope="session" value="${param.age}"/>
<c:choose>
    <c:when test="${alter <= 28}">
        Переменная alter <= 0
    </c:when>
    <c:when test="${alter > 28}">
        Переменная alter > 28
    </c:when>
    <c:otherwise>
        Не выбрано ни одно условие.
    </c:otherwise>
</c:choose>

<c:catch var ="exceptionThrown">
    <% int x = 1 / 0;%>
</c:catch>
<c:if test = "${exceptionThrown != null}">
    <p>Само исключение : ${exceptionThrown} <br />
        Сообщение: ${exceptionThrown.message}
    </p>
</c:if>

<p>HTTP headers:</p>
<ol>
    <c:forEach var="h" items="${header}">
        <li>${h.key} = ${h.value}</li>
    </c:forEach>
</ol>

<ol>
    <c:forEach var="p" items="${param}">
        <li>${p.key} = ${p.value}</li>
    </c:forEach>
</ol>


</body>
</html>