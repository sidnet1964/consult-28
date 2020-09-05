<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
    <jsp:attribute name="title">
        <title>Настройки</title>
        <link href="/css/consult-app.css" rel="stylesheet" id="consult-app-css">
    </jsp:attribute>
    <jsp:body>
        <p class="h1 ml-5 text-secondary">Настройки</p>
        <div class="float-right text-center">
            <a href="/settings-add.jsp"><img class="mb-3 w-50" src="/images/add.png" alt="Добавить"></a>
        </div>
        <%--        таблица настроек--%>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Название</th>
                <th scope="col">Значение</th>
                <th scope="col">+</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="elem" items="${settings}">
                <tr>
                    <td>${elem.name}</td>
                    <td>${elem.value}</td>
                    <td>
<%--                    форма для редактирования--%>
                        <form action='/settings-edit.jsp' method='get'>
                            <input class='btn-edit' type='text' name='name' value='${elem.name}' hidden />
                            <input class='btn-edit' type='text' name='value' value='${elem.value}' hidden />
                            <input class='btn-edit' type='submit' value=''/>
                        </form>
                        <form action='/settings/delete' onsubmit="return confirm('Вы уверены?');" method='post'>
                            <input class='btn-del' type='submit' name='${elem.name}' value=''/>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </jsp:body>
</t:template>
