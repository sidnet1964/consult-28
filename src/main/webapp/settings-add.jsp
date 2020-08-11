<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="title">
        <title>Настройки</title>
        <link href="css/login.css" rel="stylesheet" id="login-css">
    </jsp:attribute>
    <jsp:body>
        <p class="h5">
            Настройки: добавление
        </p>
        <div class="text-center">
            <form method="post" action="settings-save">
                <div class="form-group">
                    <label>
                        Название параметра
                        <input type="text" class="fadeIn second" name="name">
                    </label>
                </div>
                <div class="form-group">
                    <label>
                        Значение параметра
                        <input type="text" class="fadeIn third" name="value">
                    </label>
                </div>
                <input type="submit" class="btn btn-primary" value="Добавить">
            </form>
        </div>
    </jsp:body>
</t:template>
