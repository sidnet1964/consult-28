<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
    <jsp:attribute name="title">
        <title>Преподаватели</title>
        <link href="/css/consult-app.css" rel="stylesheet" id="consult-app-css">
    </jsp:attribute>
    <jsp:body>
        <p class="h1 ml-5 text-secondary">Преподаватели</p>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Преподаватель</th>
                <th scope="col">Начало</th>
                <th scope="col">+</th>
                <th scope="col">+</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="elem" items="${mentor}">
                <tr>
                    <td>${elem.login}</td>
                    <td>${elem.name}</td>
                    <td>${elem.is_mentor}</td>
                    <td>${mode}</td>
                    <td>
                            <%--                if ("true".equals(req.getParameter("edit")))--%>
                            <%--                    <c:if test="${login == null}">--%>
                            <%--    req.setAttribute("mode", "view"); определяется в сервлете "/mentors" --%>
                        <form action='/consults/view' method='get'>
                            <input class='btn-cons' type='submit' name='mentor' value='${elem.login}' hidden />
                            <input class='btn-cons' type='submit' value=''/>
                        </form>
                        <form action='/schedule/view' method='get'>
                            <input class='btn-sched' type='text' name='mentor' value='${elem.login}' hidden />
                            <input class='btn-sched' type='submit' value=''/>
                        </form>

<%--                        <c:if test = "${'select'.equals(mode)}">--%>
<%--                            <form action='mentor-delete' method='post'>--%>
<%--                                <input class='btn-del' type='submit' name='${elem.login}' value=''/>--%>
<%--                            </form>--%>
<%--                        </c:if>--%>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </jsp:body>
</t:template>
