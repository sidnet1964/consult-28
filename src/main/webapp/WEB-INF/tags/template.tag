<%@tag description="Template tag for consultapp" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="title" fragment="true" %>
<!doctype html>
<html>
<head>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <jsp:invoke fragment="title"/>
</head>
<body>
<div class="container">
    <%-- меню --%>
    <nav class="nav h5">
        <a class="nav-link" href="/settings/view">Настройки</a>
        <a class="nav-link" href="/user/view">Пользователи</a>
        <a class="nav-link" href="/consults/view">Консультации</a>
        <a class="nav-link" href="/schedule/view">Расписание</a>
        <c:if test="${login == null}">
            <a class="nav-link" href="login">Войти</a>
        </c:if>
        <a class="nav-link" href="#">${login}</a>
    </nav>

    <br>
    <jsp:doBody/>
</div>
</body>
</html>