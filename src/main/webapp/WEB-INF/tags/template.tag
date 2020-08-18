<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="Template tag for consultapp" pageEncoding="UTF-8"%>
<%@attribute name="title" fragment="true" %>
<!doctype html>
<html>
<head>
    <jsp:invoke fragment="title"/>

    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" id="bootstrap-css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<body>
<div class="container">
    <%-- меню --%>
    <nav class="nav h5">
        <a class="nav-link active" href="settings-view">Настройки</a>
        <a class="nav-link" href="#">Link</a>
        <a class="nav-link" href="#">Link</a>
        <c:if test="${login == null}">
            <a class="nav-link" href="login">Войти</a>
        </c:if>
    </nav>

    <br>
    <jsp:doBody/>
</div>
</body>
</html>