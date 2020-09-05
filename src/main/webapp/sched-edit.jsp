<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="title">
        <title>Расписание: редактирование</title>
        <link href="css/login.css" rel="stylesheet" id="login-css">
    </jsp:attribute>
    <jsp:body>
        <p class="h5">Расписание: редактирование</p>
        <div class="text-center">
            <form method="post" action="/schedule/save">
                <div class="form-group">
                    <label>Логин преподавателя
                        <input type="text" class="second" name="mentor" value="${param.mentor}" readonly>
                    </label>
                </div>
                <div class="form-group">
                    <label>День недели
                        <input type="text" class="fourth" name="day_of_week" value="${param.day_of_week}" readonly>
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
                        <input type="time" name="duration" value="${param.duration}" min="01:00" max="03:00">
                    </label>
                </div>
                <%-- Элемент для определения редактирования из ru.progwards.advanced.business.SettingsSave --%>
                <input type="text" name="edit" value="true" hidden>
                <input type="submit" class="btn btn-primary" value="Сохранить">
            </form>
        </div>
    </jsp:body>
</t:template>