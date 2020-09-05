<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="title">
        <title>Пользователи: редактирование</title>
        <link href="css/login.css" rel="stylesheet" id="login-css">
    </jsp:attribute>
    <jsp:body>
        <p class="h5">Пользователи: редактирование</p>
        <div class="text-center">
            <form method="post" action="user/save">
                <div class="form-group">
                    <label>Логин пользователя
                        <input type="text" class="second" name="login" value="${param.login}" readonly>
                    </label>
                </div>
                <div class="form-group">
                    <label>Имя пользователя
                        <input type="text" class="third" name="name" value="${param.name}">
                    </label>
                </div>
                <div class="form-group">
                    <label>Пароль пользователя
                        <input type="text" class="fourth" name="password" value="${param.password}">
                    </label>
                </div>
                <p>${param.login}</p>
                <p>${param.is_mentor}</p>
                <p>${param.name}</p>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" name = "ismentor">
<%--                    value="${param.is_mentor}"--%>
                    <label class="form-check-label" for="exampleCheck1">Преподаватель?</label>
                </div>
                <%-- Элемент для определения редактирования из ru.progwards.advanced.business.SettingsSave --%>
                <input type="text" name="edit" value="true" hidden>
                <input type="submit" class="btn btn-primary" value="Сохранить">
            </form>
        </div>
    </jsp:body>
</t:template>