<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="title">
        <title>Расписание: добавление</title>
        <link href="css/login.css" rel="stylesheet" id="login-css">
    </jsp:attribute>
    <jsp:body>
        <p class="h5">Расписание: добавление</p>
        <div class="text-center">
            <form method="post" action="/schedule/save">
                <div class="form-group">
                    <label>Преподаватель
                        <input type="text" class="fadeIn second" name="mentor">
                    </label>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlSelect1">День недели</label>
                    <select class="form-control" id="exampleFormControlSelect1" name="day_of_week">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                    </select>
                </div>
<%--                <div class="form-group">--%>
<%--                    <label>День недели--%>
<%--                        <input type="text" class="fadeIn third" name="day_of_week">--%>
<%--                    </label>--%>
<%--                </div>--%>
                <div class="form-group">
                    <label>Время начала
<%--                        <input type="datetime-local" class="fadeIn third" name="start">--%>
                        <input type="time" name="start" value="18:00" min="12:00" max="22:00">
                    </label>
                </div>
                <div class="form-group">
                    <label>Продолжительность
<%--                        <input type="text" class="fadeIn third" name="duration">--%>
                        <input type="time" name="duration" value="02:00" min="01:00" max="03:00">
                    </label>
                </div>
                <input type="submit" class="btn btn-primary" value="Добавить">
            </form>
        </div>
    </jsp:body>
</t:template>
