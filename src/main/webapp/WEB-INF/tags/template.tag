<%@tag description="Template tag for consultapp" pageEncoding="UTF-8"%>
<%@attribute name="title" fragment="true" %>
<html>
<head>
    <jsp:invoke fragment="title"/>

    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" id="bootstrap-css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<body>
<jsp:doBody/>
</body>
</html>