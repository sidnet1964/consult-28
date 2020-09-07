<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="title">
        <title>Консультации: добавление</title>
        <link href="css/login.css" rel="stylesheet" id="login-css">
    </jsp:attribute>
    <jsp:body>
        <p class="h5">Консультации: добавление</p>
        <div class="text-center">
            <form method="post" action="/consults/save">
                <div class="form-group">
                    <label>Логин преподавателя
                        <input type="text" class="fadeIn second" name="mentor">
                    </label>
                </div>
                <div class="form-group">
                    <label>Время начала
<%--                        <input type="datetime-local" name="startD">--%>
                        <input type="date" name="startD">
                        <input type="time" name="startT">
<%--                        value="18:00" min="12:00" max="22:00"--%>
                    </label>
                </div>
                <div class="form-group">
                    <label>Продолжительность
<%--                        <input type="text" class="fadeIn third" name="duration">--%>
                        <input type="time" name="durationS" value="00:15" min="00:05" max="00:45">
                    </label>
                </div>
                <div class="form-group">
                    <label>Логин студента
                        <input type="text" class="fadeIn third" name="student">
                    </label>
                </div>

                <input type="submit" class="btn btn-primary" value="Добавить">
            </form>
        </div>
    </jsp:body>
</t:template>
