<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
    <jsp:attribute name="title">
        <title>Расписание</title>
        <link href="/css/consult-app.css" rel="stylesheet" id="consult-app-css">
    </jsp:attribute>
    <jsp:body>
        <p class="h1 ml-5 text-secondary">Расписание</p>
        <div class="float-right text-center">
            <a href="/sched-add.jsp"><img class="mb-3 w-50" src="/images/add.png" alt="Добавить"></a>
        </div>
        <%--        таблица расписаний--%>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Преподаватель</th>
                <th scope="col">День</th>
                <th scope="col">Время</th>
                <th scope="col">Прод</th>
                <th scope="col">+</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="elem" items="${aShed}">
                <tr>
                    <td>${elem[0]}</td>
                    <td>${elem[1]}</td>
                    <td>${elem[4]}</td>
                    <td>${elem[5]}</td>
                    <td>
<%--                    форма для редактирования--%>
                        <form action='/sched-edit.jsp' method='get'>
                            <input type='text' name='mentor' value='${elem[0]}' hidden />
                            <input type='text' name='day_of_week' value='${elem[1]}' hidden />
                            <input type='text' name='start' value='${elem[4]}' hidden />
                            <input type='text' name='duration' value='${elem[5]}' hidden />
                            <input class='btn-edit' type='submit' value=''/>
                        </form>
                        <form action='/schedule/delete' onsubmit="return confirm('Вы уверены?');" method='post'>
                            <input type='text' name='mentor' value='${elem[0]}' hidden />
                            <input type='text' name='day_of_week' value='${elem[1]}' hidden />
                            <input type='text' name='start' value='${elem[2]}' hidden />
                            <input class='btn-del' type='submit' name='submit' value=''/>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </jsp:body>
</t:template>
