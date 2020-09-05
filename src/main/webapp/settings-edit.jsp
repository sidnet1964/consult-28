<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="title">
        <title>Настройки: редактирование</title>
        <link href="css/login.css" rel="stylesheet" id="login-css">
    </jsp:attribute>
    <jsp:body>
        <p class="h5">Настройки: редактирование</p>
        <div class="text-center">
            <form method="post" action="settings/save">
                <div class="form-group">
                    <label>Название параметра
                        <input type="text" class="second" name="name" value="${param.name}" readonly>
                    </label>
                </div>
                <div class="form-group">
                    <label>Значение параметра
                        <input type="text" class="third" name="value" value="${param.value}">
                    </label>
                </div>
                    <%-- Элемент для определения редактирования из ru.progwards.advanced.business.SettingsSave --%>
                <input type="text" name="edit" value="true" hidden>
                <input type="submit" class="btn btn-primary" value="Сохранить">
            </form>
        </div>
    </jsp:body>
</t:template>