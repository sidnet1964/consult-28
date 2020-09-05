<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="title">
        <title>Пользователи: добавление</title>
        <link href="css/login.css" rel="stylesheet" id="login-css">
    </jsp:attribute>
    <jsp:body>
        <p class="h5">Пользователи: добавление</p>
        <div class="text-center">
            <form method="post" action="user/save">
                <div class="form-group">
                    <label>Логин пользователя
                        <input type="text" class="fadeIn second" name="login">
                    </label>
                </div>
                <div class="form-group">
                    <label>Имя пользователя
                        <input type="text" class="fadeIn third" name="name">
                    </label>
                </div>
                <div class="form-group">
                    <label>Пароль пользователя
                        <input type="text" class="fadeIn third" name="password">
                    </label>
                </div>

                <input type="submit" class="btn btn-primary" value="Добавить">
            </form>
        </div>
    </jsp:body>
</t:template>
