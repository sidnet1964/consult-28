<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--https://css-tricks.com/snippets/css/a-guide-to-flexbox/#flexbox-background  --%>
<%--https://bootstrap-4.ru/docs/4.5/layout/grid/--%>
<%--https://bootstrap-4.ru/docs/4.5/utilities/borders/--%>
<t:template>
    <jsp:attribute name="title">
        <title>Консультации</title>
        <link href="/css/consult-app.css" rel="stylesheet" id="consult-app-css">
    </jsp:attribute>
    <jsp:body>
        <p class="h1 ml-5 text-secondary">Консультации</p>
        <div class="float-right text-center">
            <a href="/cons-add.jsp"><img class="mb-3 w-50" src="/images/add.png" alt="Добавить"></a>
        </div>
        <div class="container">
            <div class="row">
                    <%--        таблица консультаций--%>
                <c:forEach var="elem" items="${lCons}">
                    <div class="col-sm">
                        <span class="border text-nowrap">${elem.startD} ${elem.startT}</span>
                    </div>
                    <%--                <tr>--%>
                    <%--                    <td>${elem.mentor}</td>--%>
                    <%--                    <td>${elem.startD} ${elem.startT} ${elem.startS}</td>--%>
                    <%--                    <td>${elem.durationS}</td>--%>
                    <%--                    <td>${elem.student}</td>--%>
                    <%--                    <td>--%>
                    <%--&lt;%&ndash;                    форма для редактирования&ndash;%&gt;--%>
                    <%--                        <form action='/cons-edit.jsp' method='get'>--%>
                    <%--                            <input type='text' name='mentor' value='${elem.mentor}' hidden />--%>
                    <%--                            <input type='text' name='startD' value='${elem.startD}' hidden />--%>
                    <%--                            <input type='text' name='startT' value='${elem.startT}' hidden />--%>
                    <%--                            <input type='text' name='startS' value='${elem.startS}' hidden />--%>
                    <%--                            <input type='text' name='durationS' value='${elem.durationS}' hidden />--%>
                    <%--                            <input type='text' name='student' value='${elem.student}' hidden />--%>
                    <%--                            <input class='btn-edit' type='submit' value=''/>--%>
                    <%--                        </form>--%>
                    <%--                        <form action='/consults/delete' onsubmit="return confirm('Вы уверены?');" method='post'>--%>
                    <%--                            <input type='text' name='mentor' value='${elem.mentor}' hidden />--%>
                    <%--                            <input type='text' name='start' value='${elem.start}' hidden />--%>
                    <%--                            <input class='btn-del' type='submit' name='submit' value=''/>--%>
                    <%--                        </form>--%>
                    <%--                    </td>--%>
                    <%--                </tr>--%>
                </c:forEach>
            </div>
        </div>
        </tbody>
        </table>
    </jsp:body>
</t:template>
