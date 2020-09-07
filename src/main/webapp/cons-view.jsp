<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--https://css-tricks.com/snippets/css/a-guide-to-flexbox/#flexbox-background  --%>
<%--https://bootstrap-4.ru/docs/4.5/layout/grid/--%>
<%--https://bootstrap-4.ru/docs/4.5/utilities/borders/--%>
<t:template>
    <jsp:attribute name="title">
        <title>Консультации</title>
        <link href="/css/consult-app.css" rel="stylesheet" id="consult-app-css">
    </jsp:attribute>
    <jsp:body>
        <p class="h1 ml-5 text-secondary">Консультации</p>
        <div class="float-right text-center">
            <a href="/cons-add.jsp"><img class="mb-3 w-50" src="/images/add.png" alt="Добавить"></a>
        </div>
        <%--        таблица консультаций--%>
        <div class="container">
            <form action='/consults/select' onsubmit="return confirm('Вы уверены?');" method='post' id="select">
            <c:forEach var="date" items="${tCons}">
                <div class="row">
                        <%--Центрированный элемент  https://bootstrap-4.ru/docs/4.1/utilities/spacing/  --%>
                    <div class="col-sm-9">
                        <div class="mx-auto" style="width: 200px;">
                            <%--                            вывод даты консультации--%>
                            ${date.getKey()}
                        </div>
                        <div class="row">
                            <c:forEach var="elem" items="${date.getValue()}">
                                <div class="col-4 col-sm-6 m-auto">
                                        <span class="border text-nowrap">
    <c:choose>
        <c:when test="${elem.student == ''}">
            <input type='text' name='mentor' value='${elem.mentor}' hidden />
            <input type='text' name='start' value='${elem.start}' hidden />
<%--            <input class='btn-del' type='submit' name='submit' value=''/>--%>
            <button form="select" type="button" class="btn btn-primary btn-lg" name='submit' value=''>${elem.startD} ${elem.startT} ${elem.student}</button>
        </c:when>
        <c:otherwise>
            <button type="button" class="btn btn-primary btn-lg" disabled>${elem.startD} ${elem.startT} ${elem.student}</button>
        </c:otherwise>
    </c:choose>
                                        </span>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <button type="button" class="btn btn-outline-secondary btn-lg btn-block" disabled>Вторичный</button>
        </form>
        </div>
    </jsp:body>
</t:template>
<%--                    <div class="col-sm">--%>
<%--                        <span class="border text-nowrap">${elem.startD} ${elem.startT}</span>--%>
<%--                    </div>--%>
