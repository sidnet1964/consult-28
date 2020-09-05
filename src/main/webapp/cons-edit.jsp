<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="title">
        <title>Консультации: редактирование</title>
        <link href="css/login.css" rel="stylesheet" id="login-css">
    </jsp:attribute>
    <jsp:body>
        <p class="h5">Консультации: редактирование</p>
        <div class="text-center">
            <form method="post" action="/consults/save">
                <div class="form-group">
                    <label>Логин преподавателя
                        <input type="text" class="second" name="mentor" value="${param.mentor}" readonly>
                    </label>
                </div>
                <div class="form-group">
                    <label>Время начала
                        <input type="text" class="third" name="start" value="${param.start}" readonly>
                    </label>
                </div>
                <div class="form-group">
                    <label>Продолжительность
<%--                        <input type="text" class="fourth" name="duration" value="${param.duration}">--%>
                        <input type="time" name="duration" value="${param.duration}" min="00:05" max="00:55">
                    </label>
                </div>
                <div class="form-group">
                    <label>Логин студента
                        <input type="text" class="fourth" name="student" value="${param.student}">
                    </label>
                </div>
                <%-- Элемент для определения редактирования из ru.progwards.advanced.business.SettingsSave --%>
                <input type="text" name="edit" value="true" hidden>
                <input type="submit" class="btn btn-primary" value="Сохранить">
            </form>
        </div>
    </jsp:body>
</t:template>