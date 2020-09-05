<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
    <jsp:attribute name="title">
        <title>Пользователи</title>
        <link href="/css/consult-app.css" rel="stylesheet" id="consult-app-css">
    </jsp:attribute>
    <jsp:body>
        <p class="h1 ml-5 text-secondary">Пользователи</p>
        <div class="float-right text-center">
            <a href="/user-add.jsp"><img class="mb-3 w-50" src="/images/add.png" alt="Добавить"></a>
        </div>
        <%--        таблица пользователей--%>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Название</th>
                <th scope="col">Значение</th>
                <th scope="col">+</th>
                <th scope="col">+</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="elem" items="${user}">
                <tr>
                    <td>${elem.login}</td>
                    <td>${elem.name}</td>
                    <td>${elem.is_mentor}</td>
                    <td>
<%--                    форма для редактирования--%>
                        <form action='/user-edit.jsp' method='get'>
                            <input class='btn-edit' type='text' name='login' value='${elem.login}' hidden />
                            <input class='btn-edit' type='text' name='name' value='${elem.name}' hidden />
                            <input class='btn-edit' type='text' name='password' value='${elem.password}' hidden />
                            <input type="checkbox" class="form-check-input" id="exampleCheck1" name = "ismentor" value="${elem.is_mentor}" disabled>
<%--                            <input type="checkbox" class="form-check-input" id="exampleCheck1" name = "ismentor" value="${param.is_mentor}">--%>

                            <input class='btn-edit' type='submit' value=''/>
                        </form>
                        <form action='/user/delete' onsubmit="return confirm('Вы уверены?');" method='post'>
                            <input class='btn-del' type='submit' name='${elem.login}' value=''/>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </jsp:body>
</t:template>
